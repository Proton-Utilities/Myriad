const WebSocket = require("ws");
const fs = require("fs");
const path = require("path");
const readline = require("readline");

const HANDLER = path.join(__dirname, "handlerClient.luau");
const CFGP = path.join(__dirname, "config.json");

const C = {
  Reset: "\x1b[0m",
  Bright: "\x1b[1m",
  Dim: "\x1b[2m",
  Red: "\x1b[31m",
  Green: "\x1b[32m",
  Yellow: "\x1b[33m",
  Blue: "\x1b[34m",
  Magenta: "\x1b[35m",
  Cyan: "\x1b[36m",
  White: "\x1b[37m",
  Gray: "\x1b[90m",
  BgRed: "\x1b[41m",
};

let config = {
  server: { port: 3000 },
  input: "script.lua",
  enableMacros: false,
  watchList: [],
};

function log(msg) {
  readline.clearLine(process.stdout, 0);
  readline.cursorTo(process.stdout, 0);

  process.stdout.write(msg + "\n");

  if (paused) {
    rl.prompt(true);
  }
}

if (fs.existsSync(CFGP)) {
  try {
    config = JSON.parse(fs.readFileSync(CFGP, "utf8"));
  } catch (e) {
    console.error(`${C.Red}Couldnt parsing config.json ${C.Reset}`, e);
  }
}

const wss = new WebSocket.Server({ port: config.server.port });

let activeClient = null;
let paused = false;
let eId = 0;
const pendingEvals = new Map();

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  prompt: "",
});

function getscript() {
  if (!fs.existsSync(config.input))
    return `warn("file @ ${config.input} not found")`;

  const raw = fs.readFileSync(config.input, "utf8");

  if (!config.enableDebugClient) {
    return raw;
  }

  let handler = "";
  if (fs.existsSync(HANDLER)) {
    handler = fs.readFileSync(HANDLER, "utf8");
  }

  return handler + "\n\n" + raw;
}

if (config.hotReloads && fs.existsSync(config.input)) {
  fs.watchFile(config.input, { interval: 500 }, () => {
    console.log(`${C.Green}[Update]${C.Reset} Pushing update`);
    const payload = JSON.stringify({ type: "SCRIPT", payload: getscript() });

    wss.clients.forEach(function each(client) {
      if (client.readyState === WebSocket.OPEN) {
        client.send(payload);
      }
    });
  });
}

rl.on("line", (line) => {
  line = line.trim();
  if (!activeClient || !paused) return;

  if (line === "continue" || line === "cont" || line === "c") {
    console.log(`${C.Green}[Server]${C.Reset} Resuming execution`);
    activeClient.send(JSON.stringify({ type: "RESUME" }));
    paused = false;
    rl.setPrompt("");
    rl.prompt();
  } else {
    const id = ++eId;
    pendingEvals.set(id, { watch: false });

    activeClient.send(
      JSON.stringify({
        type: "EVAL",
        id,
        code: line,
      }),
    );
  }
});

wss.on("connection", (ws) => {
  activeClient = ws;
  let wPending = 0;

  const dbPrompt = () => {
    log("");
    log(`${C.Gray}   Type 'continue' to resume.${C.Reset}`);
    log(`${C.Gray}   Type code to eval (From global or watch stack).${C.Reset}\n`);

    rl.setPrompt(`${C.Magenta}DEBUG>${C.Reset} `);
    rl.prompt(true);
  };

  ws.on("message", (message) => {
    try {
      const raw = message.toString();
      const data = JSON.parse(raw);

      if (data.type === "READY") {
        console.log(`${C.Blue}[READY]${C.Reset} Sending script`);
        ws.send(JSON.stringify({ type: "SCRIPT", payload: getscript() }));
      }

      if (data.type === "LOG") {
        const time = new Date().toLocaleTimeString();
        let out = "";

        if (data.level === "error") out = `${C.Red}[ERR] ${data.msg}${C.Reset}`;
        else if (data.level === "warn")
          out = `${C.Yellow}[WRN] ${data.msg}${C.Reset}`;
        else out = `${C.Dim}[${time}]${C.Reset} ${data.msg}`;

        log(out);
      } else if (data.type === "HALT") {
        paused = true;
        activeClient = ws;

        console.log(`\n${C.BgRed}${C.White}${C.Bright} BREAKPOINT ${C.Reset}`);

        if (data.watchStack) {
          try {
            const stack = JSON.parse(data.watchStack);
            const keys = Object.keys(stack);

            if (keys.length > 0) {
              console.log(`${C.Cyan}Local Variables:${C.Reset}`);
              for (const key of keys) {
                let val = stack[key];
                if (typeof val === "object") val = JSON.stringify(val);
                console.log(
                  `   ${C.Yellow}${key}${C.Reset} = ${C.White}${val}${C.Reset}`,
                );
              }
              console.log("");
            }
          } catch (e) {
            console.log(
              `${C.Red}Failed to parse watch stack: ${e.message}${C.Reset}`,
            );
            console.log(`${C.Dim}${data.watchStack}${C.Reset}\n`);
          }
        }

        if (config.watchList?.length) {
          console.log(`${C.Cyan}Watch list:${C.Reset}`);
          wPending = config.watchList.length;
          for (const expr of config.watchList) {
            const id = ++eId;
            pendingEvals.set(id, { watch: true, expr: expr });
            activeClient.send(
              JSON.stringify({ type: "EVAL", id, code: `return ${expr}` }),
            );
          }
        } else {
          dbPrompt();
        }
      } else if (data.type === "EVAL_RESULT") {
        const meta = pendingEvals.get(data.id);
        pendingEvals.delete(data.id);
        if (!meta) return;

        if (meta.watch) {
          console.log(
            `   ${C.Cyan}${meta.expr}${C.Reset} = ${C.White}${data.result}${C.Reset}`,
          );
          wPending--;
          if (wPending <= 0) dbPrompt();
        } else {
          console.log(`   ${C.Green}< ${data.result}${C.Reset}`);
          rl.prompt();
        }
      } else if (data.type === "ERROR") {
        console.error(`${C.Red}[Client Error] ${data.msg}${C.Reset}`);
        if (data.stack) console.error(`${C.Dim}${data.stack}${C.Reset}`);
        const meta = pendingEvals.get(data.id);
        if (meta && meta.watch) {
          wPending--;
          if (wPending <= 0) dbPrompt();
        }
      }
    } catch (e) {
      console.log(`[Raw] ${message}`);
    }
  });

  ws.on("close", () => {
    if (activeClient === ws) {
      paused = false;
    }
  });
});

console.log(
  `${C.Green}${C.Bright}Running @ ws://localhost:${config.server.port}${C.Reset}\n`,
);

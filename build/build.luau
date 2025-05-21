--!nocheck
--!nolint

--[[
    @author Proton-Utilities
	@version 1.2.0
    @name ProCMP
    @description Build composer system using Lune & darklua
]]

local a,b,c,d,e,f=require'@lune/stdio',require'@lune/fs',require'@lune/process',
require'@lune/serde',require'@lune/net',require'@lune/datetime'local g=d.decode(
'json',b.readFile(c.args[1]))local h,i,j,k,l=(g.buildConfigs)local m,n,o={[
'__COMPOSER.Insert(__COMPOSER.build)']=function()return j or''end,[
'__COMPOSER.Insert(__COMPOSER.genDate)']=function()return string.format('%q',f.
now():toIsoDate()or'')end,['__COMPOSER.Insert(__COMPOSER.cfg)']=function()return
string.format('%q',k or'')end,['__COMPOSER.Insert(__COMPOSER.vers)']=function()
return string.format('%q',l or'')end},'RELEASE_BODY.md',{}for p,q in pairs(h)do
table.insert(o,q.name)end local p=a.prompt('select','Build configuration',o)k=h[
p].name local q=h[p]l=q.promptVersion and a.prompt('text',
'Build version (vMAJOR.MINOR.PATCH)')or'v0.0.0'local r=c.spawn('darklua',{
'process',q.input,q.output,'-c',q.darkluaConfig})if not r.ok then print(r.stderr
)return end j=b.readFile(q.output)i=b.readFile(q.frame)for s,t in pairs(m)do i=i
:gsub(s:gsub('([%%%+%-%*%?%[%]%^%$%(%)%%])','%%%1'),function()return t()end)end
b.writeFile(q.output,i)print('Build complete: '..q.output)if g.
openComposedOutput and c.os=='windows'then c.spawn('powershell',{
'-ExecutionPolicy','Bypass','-NoProfile','-Command',`code '{q.output}'`})end if
q.promptDeploy and g.deployment.enabled then local s=g.deployment.github if a.
prompt('confirm','Do you want to distribute this build publicly?')then b.
writeFile(n,`# {k} {l}`)if c.os=='windows'then c.spawn('powershell',{
'-ExecutionPolicy','Bypass','-NoProfile','-Command',`code '{n}'`})end if a.
prompt('confirm','Add release notes, and confirm when done')then local t=e.
request{url=string.format('https://api.github.com/repos/%s/%s/releases',s.owner,
s.repo),method='POST',headers={Authorization='Bearer '..s.apiKey,['Content-Type'
]='application/json'},body=e.jsonEncode{tag_name=l,name=`{k} {l}`,body=b.isFile(
n)and b.readFile(n)or'',draft=false,prerelease=q.prerelease}}if t.ok then print(
'Deployment successful: '..t.statusMessage)else print('Deployment failed: '..t.
statusMessage)print(t.body)if t.body:find'Bad credentials'then warn
'\u{2753} Did you set up github deployment in the pcmp configuration file?'end
end end end if b.isFile(n)then b.removeFile(n)end end
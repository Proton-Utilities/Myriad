--!nocheck
--!nolint

--[[
    @author Proton-Utilities
	@version 1.2.3
    @name ProCMP
    @description Build composer system using Lune & darklua
]]

local a,b,c,d,e,f=require'@lune/stdio',require'@lune/fs',require'@lune/process',
require'@lune/serde',require'@lune/net',require'@lune/datetime'local g=d.decode(
'json',b.readFile(c.args[1]))local h,i,j,k,l=(g.buildConfigs)local m,n,o,p={[
'__COMPOSER.Insert(__COMPOSER.build)']=function()return j or''end,[
'__COMPOSER.Insert(__COMPOSER.genDate)']=function()return string.format('%q',f.
now():toIsoDate()or'')end,['__COMPOSER.Insert(__COMPOSER.cfg)']=function()return
string.format('%q',k or'')end,['__COMPOSER.Insert(__COMPOSER.vers)']=function()
return string.format('%q',l or'')end},(c.env.TEMP or c.env.TMP)..
'/RELEASE_BODY.md',function(m)return m:match'^.+[\\/](.+)$'or m end,{}for q,r in
pairs(h)do table.insert(p,r.name)end local q=a.prompt('select',
'Build configuration',p)k=h[q].name local r=h[q]l=r.promptVersion and a.prompt(
'text','Build version (vMAJOR.MINOR.PATCH)')or'v0.0.0'local s=c.spawn('darklua',
{'process',r.input,r.output,'-c',r.darkluaConfig})if not s.ok then print(s.
stderr)return end j=b.readFile(r.output)i=b.readFile(r.frame)for t,u in pairs(m)
do i=i:gsub(t:gsub('([%%%+%-%*%?%[%]%^%$%(%)%%])','%%%1'),function()return u()
end)end b.writeFile(r.output,i)print('Build complete: '..r.output)if g.
openComposedOutput and c.os=='windows'then c.spawn('powershell',{
'-ExecutionPolicy','Bypass','-NoProfile','-Command',`code '{r.output}'`})end if
r.promptDeploy and g.deployment.enabled then local t=g.deployment.github if a.
prompt('confirm','Do you want to distribute this build publicly?')then b.
writeFile(n,`# {k} {l}`)if c.os=='windows'then c.spawn('powershell',{
'-ExecutionPolicy','Bypass','-NoProfile','-Command',`code '{n}'`})end if a.
prompt('confirm','Add release notes, and confirm when done')then local u=e.
request{url=string.format('https://api.github.com/repos/%s/%s/releases',t.owner,
t.repo),method='POST',headers={Authorization='Bearer '..t.apiKey,['Content-Type'
]='application/json'},body=e.jsonEncode{tag_name=l,name=`{k} {l}`,body=b.isFile(
n)and b.readFile(n)or'',draft=false,prerelease=r.prerelease}}if u.ok then print(
'Deployment successful: '..u.statusMessage)local v=d.decode('json',u.body)local
w=v.id if w and b.isFile(r.output)then local x=o(r.output)local y,z=string.
format([[https://uploads.github.com/repos/%s/%s/releases/%s/assets?name=%s]],t.
owner,t.repo,tostring(w),x),b.readFile(r.output)local A=e.request{url=y,method=
'POST',headers={Authorization='Bearer '..t.apiKey,['Content-Type']=
'application/octet-stream'},body=z}if A.ok then print('Asset uploaded: '..x)else
print('Asset upload failed: '..A.statusMessage)print(A.body)end else print
'Could not upload asset: release id or file missing'end else print(
'Deployment failed: '..u.statusMessage)print(u.body)if u.body:find
'Bad credentials'then warn
'\u{2753} Did you set up github deployment in the pcmp configuration file?'end
end end end if b.isFile(n)then b.removeFile(n)end end
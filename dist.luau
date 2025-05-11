--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    @repository https://github.com/Proton-Utilities/Myriad

    @author Proton-Utilities
    @name Myriad

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()return function(b)print(`{b}\n`)end
end function a.b()local b,c,d,e=buffer.create(64),buffer.create(256),
[[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/]],string.byte
'='for f=1,64 do local g,h=f-1,string.byte(d,f)buffer.writeu8(b,g,h)buffer.
writeu8(c,h,g)end local f,g=function(f)local g=buffer.len(f)local h=math.ceil(g/
3)local i=h*4 local j=buffer.create(i)for k=1,h-1 do local l,m=(k-1)*3,(k-1)*4
local n=bit32.byteswap(buffer.readu32(f,l))local o,p,q,r=bit32.rshift(n,26),
bit32.band(bit32.rshift(n,20),0b111111),bit32.band(bit32.rshift(n,14),0b111111),
bit32.band(bit32.rshift(n,8),0b111111)buffer.writeu8(j,m,buffer.readu8(b,o))
buffer.writeu8(j,m+1,buffer.readu8(b,p))buffer.writeu8(j,m+2,buffer.readu8(b,q))
buffer.writeu8(j,m+3,buffer.readu8(b,r))end local k=g%3 if k==1 then local l=
buffer.readu8(f,g-1)local m,n=bit32.rshift(l,2),bit32.band(bit32.lshift(l,4),
0b111111)buffer.writeu8(j,i-4,buffer.readu8(b,m))buffer.writeu8(j,i-3,buffer.
readu8(b,n))buffer.writeu8(j,i-2,e)buffer.writeu8(j,i-1,e)elseif k==2 then local
l=bit32.bor(bit32.lshift(buffer.readu8(f,g-2),8),buffer.readu8(f,g-1))local m,n,
o=bit32.rshift(l,10),bit32.band(bit32.rshift(l,4),0b111111),bit32.band(bit32.
lshift(l,2),0b111111)buffer.writeu8(j,i-4,buffer.readu8(b,m))buffer.writeu8(j,i-
3,buffer.readu8(b,n))buffer.writeu8(j,i-2,buffer.readu8(b,o))buffer.writeu8(j,i-
1,e)elseif k==0 and g~=0 then local l=bit32.bor(bit32.lshift(buffer.readu8(f,g-3
),16),bit32.lshift(buffer.readu8(f,g-2),8),buffer.readu8(f,g-1))local m,n,o,p=
bit32.rshift(l,18),bit32.band(bit32.rshift(l,12),0b111111),bit32.band(bit32.
rshift(l,6),0b111111),bit32.band(l,0b111111)buffer.writeu8(j,i-4,buffer.readu8(b
,m))buffer.writeu8(j,i-3,buffer.readu8(b,n))buffer.writeu8(j,i-2,buffer.readu8(b
,o))buffer.writeu8(j,i-1,buffer.readu8(b,p))end return j end,function(f)local g=
buffer.len(f)local h,i=math.ceil(g/4),0 if g~=0 then if buffer.readu8(f,g-1)==e
then i+=1 end if buffer.readu8(f,g-2)==e then i+=1 end end local j=h*3-i local k
=buffer.create(j)for l=1,h-1 do local m,n=(l-1)*4,(l-1)*3 local o,p,q,r=buffer.
readu8(c,buffer.readu8(f,m)),buffer.readu8(c,buffer.readu8(f,m+1)),buffer.
readu8(c,buffer.readu8(f,m+2)),buffer.readu8(c,buffer.readu8(f,m+3))local s=
bit32.bor(bit32.lshift(o,18),bit32.lshift(p,12),bit32.lshift(q,6),r)local t,u,v=
bit32.rshift(s,16),bit32.band(bit32.rshift(s,8),0b11111111),bit32.band(s,
0b11111111)buffer.writeu8(k,n,t)buffer.writeu8(k,n+1,u)buffer.writeu8(k,n+2,v)
end if g~=0 then local l,m=(h-1)*4,(h-1)*3 local n,o,p,q=buffer.readu8(c,buffer.
readu8(f,l)),buffer.readu8(c,buffer.readu8(f,l+1)),buffer.readu8(c,buffer.
readu8(f,l+2)),buffer.readu8(c,buffer.readu8(f,l+3))local r=bit32.bor(bit32.
lshift(n,18),bit32.lshift(o,12),bit32.lshift(p,6),q)if i<=2 then local s=bit32.
rshift(r,16)buffer.writeu8(k,m,s)if i<=1 then local t=bit32.band(bit32.rshift(r,
8),0b11111111)buffer.writeu8(k,m+1,t)if i==0 then local u=bit32.band(r,
0b11111111)buffer.writeu8(k,m+2,u)end end end end return k end return{encode=f,
decode=g}end function a.c()local b,c,d,e={99,124,119,123,242,107,111,197,48,1,
103,43,254,215,171,118,202,130,201,125,250,89,71,240,173,212,162,175,156,164,114
,192,183,253,147,38,54,63,247,204,52,165,229,241,113,216,49,21,4,199,35,195,24,
150,5,154,7,18,128,226,235,39,178,117,9,131,44,26,27,110,90,160,82,59,214,179,41
,227,47,132,83,209,0,237,32,252,177,91,106,203,190,57,74,76,88,207,208,239,170,
251,67,77,51,133,69,249,2,127,80,60,159,168,81,163,64,143,146,157,56,245,188,182
,218,33,16,255,243,210,205,12,19,236,95,151,68,23,196,167,126,61,100,93,25,115,
96,129,79,220,34,42,144,136,70,238,184,20,222,94,11,219,224,50,58,10,73,6,36,92,
194,211,172,98,145,149,228,121,231,200,55,109,141,213,78,169,108,86,244,234,101,
122,174,8,186,120,37,46,28,166,180,198,232,221,116,31,75,189,139,138,112,62,181,
102,72,3,246,14,97,53,87,185,134,193,29,158,225,248,152,17,105,217,142,148,155,
30,135,233,206,85,40,223,140,161,137,13,191,230,66,104,65,153,45,15,176,84,187,
22},{82,9,106,213,48,54,165,56,191,64,163,158,129,243,215,251,124,227,57,130,155
,47,255,135,52,142,67,68,196,222,233,203,84,123,148,50,166,194,35,61,238,76,149,
11,66,250,195,78,8,46,161,102,40,217,36,178,118,91,162,73,109,139,209,37,114,248
,246,100,134,104,152,22,212,164,92,204,93,101,182,146,108,112,72,80,253,237,185,
218,94,21,70,87,167,141,157,132,144,216,171,0,140,188,211,10,247,228,88,5,184,
179,69,6,208,44,30,143,202,63,15,2,193,175,189,3,1,19,138,107,58,145,17,65,79,
103,220,234,151,242,207,206,240,180,230,115,150,172,116,34,231,173,53,133,226,
249,55,232,28,117,223,110,71,241,26,113,29,41,197,137,111,183,98,14,170,24,190,
27,252,86,62,75,198,210,121,32,154,219,192,254,120,205,90,244,31,221,168,51,136,
7,199,49,177,18,16,89,39,128,236,95,96,81,127,169,25,181,74,13,45,229,122,159,
147,201,156,239,160,224,59,77,174,42,245,176,200,235,187,60,131,83,153,97,23,43,
4,126,186,119,214,38,225,105,20,99,85,33,12,125},{0,1,2,4,8,16,32,64,128,27,54,
108,216,171,77,154,47,94,188,99,198,151,53,106,212,179,125,250,239,197,145,57},
function(b)local c=bit32.lshift(b,1)return if bit32.band(b,128)==0 then c else
bit32.bxor(c,27)%256 end local f,g,h,i,j,k,l=function(f,g)g=if g then c else b
for h=1,4 do for i=1,4 do f[h][i]=g[f[h][i]+1]end end end,function(f,g)f[1][3],f
[2][3],f[3][3],f[4][3]=f[3][3],f[4][3],f[1][3],f[2][3]if g then f[1][2],f[2][2],
f[3][2],f[4][2]=f[4][2],f[1][2],f[2][2],f[3][2]f[1][4],f[2][4],f[3][4],f[4][4]=f
[2][4],f[3][4],f[4][4],f[1][4]else f[1][2],f[2][2],f[3][2],f[4][2]=f[2][2],f[3][
2],f[4][2],f[1][2]f[1][4],f[2][4],f[3][4],f[4][4]=f[4][4],f[1][4],f[2][4],f[3][4
]end end,function(f,g)for h=1,4 do for i=1,4 do f[h][i]=bit32.bxor(f[h][i],g[h][
i])end end end,function(f,g)local h,i if g then for j=1,4 do h=e(e(bit32.bxor(f[
j][1],f[j][3])))i=e(e(bit32.bxor(f[j][2],f[j][4])))f[j][1],f[j][2]=bit32.bxor(f[
j][1],h),bit32.bxor(f[j][2],i)f[j][3],f[j][4]=bit32.bxor(f[j][3],h),bit32.bxor(f
[j][4],i)end end local j for k=1,4 do j=f[k]h,i=bit32.bxor(j[1],j[2],j[3],j[4]),
j[1]for l=1,4 do j[l]=bit32.bxor(j[l],h,e(bit32.bxor(j[l],j[l+1]or i)))end end
end,function(f,g,h)if h then table.move(g[1],1,4,1,f)table.move(g[2],1,4,5,f)
table.move(g[3],1,4,9,f)table.move(g[4],1,4,13,f)else for i=1,#g/4 do table.
clear(f[i])table.move(g,i*4-3,i*4,1,f[i])end end return f end,function(f,g,h)
table.clear(f)for i=1,math.min(#g,#h)do table.insert(f,bit32.bxor(g[i],h[i]))end
return f end,function(f,g)local h=true for i=if g then 1 else#f,if g then#f else
1,if g then 1 else-1 do if f[i]==255 then f[i]=0 else f[i]+=1 h=false break end
end return h,f end local m,n,o,p=function(m)local n,o,p,q,r=j(if#m==16 then{{},{
},{},{}}elseif#m==24 then{{},{},{},{},{},{}}else{{},{},{},{},{},{},{},{}},m),#m/
4,2,{}while#n<(#m/4+7)*4 do r=table.clone(n[#n])if#n%o==0 then table.insert(r,
table.remove(r,1))for s=1,4 do r[s]=b[r[s]+1]end r[1]=bit32.bxor(r[1],d[p])p+=1
elseif#m==32 and#n%o==4 then for s=1,4 do r[s]=b[r[s]+1]end end table.clear(q)k(
r,table.move(r,1,4,1,q),n[#n-o+1])table.insert(n,r)end table.clear(q)for s=1,#n/
4 do table.insert(q,{})table.move(n,s*4-3,s*4,1,q[#q])end return q end,function(
m,n,o,p,q)j(p,o)h(p,n[1])for r=2,#m/4+6 do f(p)g(p)i(p)h(p,n[r])end f(p)g(p)h(p,
n[#n])return j(q,p,true)end,function(m,n,o,p,q)j(p,o)h(p,n[#n])g(p,true)f(p,true
)for r=#m/4+6,2,-1 do h(p,n[r])i(p,true)g(p,true)f(p,true)end h(p,n[1])return j(
q,p,true)end,function(m)if type(m)=='string'then local n={}for o=1,string.len(m)
,7997 do table.move({string.byte(m,o,o+7996)},1,7997,o,n)end return n elseif
type(m)=='table'then for n,o in ipairs(m)do assert(type(o)=='number'and math.
floor(o)==o and 0<=o and o<256,'Unable to cast value to bytes')end return m else
error'Unable to cast value to bytes'end end local q=function(q,r,s,t,u)q=p(q)
assert(#q==16 or#q==24 or#q==32,'Key must be either 16, 24 or 32 bytes long')r=
p(r)assert(#r%(u or 16)==0,'Input must be a multiple of '..(if u then
'segment size '..u else'16')..' bytes in length')if s then if type(t)=='table'
then t=table.clone(t)local v,w=t.Length,t.LittleEndian assert(type(v)=='number'
and 0<v and v<=16,'Counter value length must be between 1 and 16 bytes')t.Prefix
=p(t.Prefix or{})t.Suffix=p(t.Suffix or{})assert(#t.Prefix+#t.Suffix+v==16,
'Counter must be 16 bytes long')t.InitValue=if t.InitValue==nil then{1}else
table.clone(p(t.InitValue))assert(#t.InitValue<=v,
'Initial value length must be of the counter value')t.InitOverflow=if t.
InitOverflow==nil then table.create(v,0)else table.clone(p(t.InitOverflow))
assert(#t.InitOverflow<=v,
'Initial overflow value length must be of the counter value')for x=1,v-#t.
InitValue do table.insert(t.InitValue,1+if w then#t.InitValue else 0,0)end for x
=1,v-#t.InitOverflow do table.insert(t.InitOverflow,1+if w then#t.InitOverflow
else 0,0)end elseif type(t)~='function'then local v,w=if t then p(t)else table.
create(16,0),{}assert(#v==16,'Counter must be 16 bytes long')t={Length=16,Prefix
=w,Suffix=w,InitValue=v,InitOverflow=table.create(16,0)}end elseif s==false then
t=if t==nil then table.create(16,0)else p(t)assert(#t==16,
'Initialization vector must be 16 bytes long')end if u then u=math.floor(
tonumber(u)or 1)assert(type(u)=='number'and 0<u and u<=16,
'Segment size must be between 1 and 16 bytes')end return q,r,m(q),t,u end return
{encrypt_ECB=function(r,s)local t r,s,t=q(r,s)local u,v,w,x={},{},{{},{},{},{}},
{}for y=1,#s,16 do table.move(s,y,y+15,1,v)table.move(n(r,t,v,w,x),1,16,y,u)end
return u end,decrypt_ECB=function(r,s)local t r,s,t=q(r,s)local u,v,w,x={},{},{{
},{},{},{}},{}for y=1,#s,16 do table.move(s,y,y+15,1,v)table.move(o(r,t,v,w,x),1
,16,y,u)end return u end,encrypt_CBC=function(r,s,t)local u r,s,u,t=q(r,s,false,
t)local v,w,x,y,z={},{},t,{{},{},{},{}},{}for A=1,#s,16 do table.move(s,A,A+15,1
,w)table.move(n(r,u,k(z,w,x),y,x),1,16,A,v)end return v end,decrypt_CBC=function
(r,s,t)local u r,s,u,t=q(r,s,false,t)local v,w,x,y,z={},{},t,{{},{},{},{}},{}for
A=1,#s,16 do table.move(s,A,A+15,1,w)table.move(k(w,o(r,u,w,y,z),x),1,16,A,v)
table.move(s,A,A+15,1,x)end return v end,encrypt_PCBC=function(r,s,t)local u r,s
,u,t=q(r,s,false,t)local v,w,x,y,z,A={},{},t,table.create(16,0),{{},{},{},{}},{}
for B=1,#s,16 do table.move(s,B,B+15,1,w)table.move(n(r,u,k(w,k(A,x,w),y),z,x),1
,16,B,v)table.move(s,B,B+15,1,y)end return v end,decrypt_PCBC=function(r,s,t)
local u r,s,u,t=q(r,s,false,t)local v,w,x,y,z,A={},{},t,table.create(16,0),{{},{
},{},{}},{}for B=1,#s,16 do table.move(s,B,B+15,1,w)table.move(k(y,o(r,u,w,z,A),
k(w,x,y)),1,16,B,v)table.move(s,B,B+15,1,x)end return v end,encrypt_CFB=function
(r,s,t,u)local v r,s,v,t,u=q(r,s,false,t,if u==nil then 1 else u)local w,x,y,z,A
,B={},{},t,{},{{},{},{},{}},{}for C=1,#s,u do table.move(s,C,C+u-1,1,x)table.
move(k(z,n(r,v,y,A,B),x),1,u,C,w)for D=16,u+1,-1 do table.insert(z,1,y[D])end
table.move(z,1,16,1,y)end return w end,decrypt_CFB=function(r,s,t,u)local v r,s,
v,t,u=q(r,s,false,t,if u==nil then 1 else u)local w,x,y,z,A,B={},{},t,{},{{},{},
{},{}},{}for C=1,#s,u do table.move(s,C,C+u-1,1,x)table.move(k(z,n(r,v,y,A,B),x)
,1,u,C,w)for D=16,u+1,-1 do table.insert(x,1,y[D])end table.move(x,1,16,1,y)end
return w end,encrypt_OFB=function(r,s,t)local u r,s,u,t=q(r,s,false,t)local v,w,
x,y,z={},{},t,{{},{},{},{}},{}for A=1,#s,16 do table.move(s,A,A+15,1,w)table.
move(n(r,u,x,y,z),1,16,1,x)table.move(k(z,w,x),1,16,A,v)end return v end,
encrypt_CTR=function(r,s,t)local u r,s,u,t=q(r,s,true,t)local v,w,x,y,z,A,B={},{
},{},{{},{},{},{}},{},(type(t)=='table')for C=1,#s,16 do if A then if C>1 and l(
t.InitValue,t.LittleEndian)then table.move(t.InitOverflow,1,16,1,t.InitValue)end
table.clear(x)table.move(t.Prefix,1,#t.Prefix,1,x)table.move(t.InitValue,1,t.
Length,#x+1,x)table.move(t.Suffix,1,#t.Suffix,#x+1,x)else B=p(t(x,(C+15)/16))
assert(#B==16,'Counter must be 16 bytes long')table.move(B,1,16,1,x)end table.
move(s,C,C+15,1,w)table.move(k(x,n(r,u,x,y,z),w),1,16,C,v)end return v end}end
function a.d()local b,c,d,e,f=a.load'b',a.load'c',buffer.tostring,bit32.lshift(1
,10),{}function f.encrypt(g,h,i)return c.encrypt_CBC(h,g,i)end function f.
decrypt(g,h,i)return c.decrypt_CBC(h,g,i)end function f.base64encode(g)local h=
buffer.fromstring(g)return buffer.tostring(b.encode(h))end function f.
base64decode(g)local h=b.decode(g)return buffer.tostring(h)end function f.random
(g)if g>e or g<0 then error('Expected number within range (0, 1024), got: '..
tostring(g),0)else local h={}for i=33,57 do table.insert(h,string.char(i))end
for i=65,90 do table.insert(h,string.char(i))end for i=97,122 do table.insert(h,
string.char(i))end local i={}for j=1,g do local k=math.random(1,#h)table.insert(
i,h[k])end return table.concat(i)end end return f end function a.e()return
function()local b=a.load'd'if not getfenv(0).crypt or not getfenv(0).crypt.
encrypt then return{status=400,message='Global not found'}end local c,d,e=
'1234567890abcdef','GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY','1234567890abcdef'local f,
g=pcall(function()return crypt.encrypt(c,d,e)end)if not f then return{status=500
,message='Encrypt failed: '..tostring(g)}end local h,i=
'G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh',b.base64encode(g)if i~=h then print(i)print(h
)return{status=500,message='Encrypted data mismatch'}end return{status=200,
message='Passed'}end end function a.f()local b,c={},{}for d=65,90 do table.
insert(b,d)end for d=97,122 do table.insert(b,d)end for d=48,57 do table.insert(
b,d)end table.insert(b,43)table.insert(b,47)for d,e in ipairs(b)do c[e]=d end
local d,e,f,g={},bit32.rshift,bit32.lshift,bit32.band function d.Encode(h)local
i,j={},0 for k=1,#h,3 do local l,m,n=string.byte(h,k,k+2)local o,p,q,r=e(l,2),f(
g(l,3),4)+e(m or 0,4),f(g(m or 0,15),2)+e(n or 0,6),g(n or 0,63)j=j+1 i[j]=b[o+1
]j=j+1 i[j]=b[p+1]j=j+1 i[j]=m and b[q+1]or 61 j=j+1 i[j]=n and b[r+1]or 61 end
local k,l,m={},0 for n=1,j,4096 do l=l+1 m=n+4096-1 k[l]=string.char(table.
unpack(i,n,m>j and j or m))end return table.concat(k)end function d.Decode(h)
local i,j={},0 for k=1,#h,4 do local l,m,n,o=string.byte(h,k,k+3)local p,q,r,s=c
[l]-1,c[m]-1,(c[n]or 1)-1,(c[o]or 1)-1 local t,u,v=f(p,2)+e(q,4),f(g(q,15),4)+e(
r,2),f(g(r,3),6)+s j=j+1 i[j]=t if n~=61 then j=j+1 i[j]=u end if o~=61 then j=j
+1 i[j]=v end end local k,l,m={},0 for n=1,j,4096 do l=l+1 m=n+4096-1 k[l]=
string.char(table.unpack(i,n,m>j and j or m))end return table.concat(k)end
return d end function a.g()return function()local b=a.load'f'if not getfenv(0).
crypt or not getfenv(0).crypt.decrypt then return{status=400,message=
'Global not found'}end local c,d,e=b.Decode'G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh',
'GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY','1234567890abcdef'local f,g=pcall(function()
return crypt.decrypt(c,d,e)end)if not f then return{status=500,message=
'Decrypt failed: '..tostring(g)}elseif not g then return{status=500,message=
'Decrypt returned nothing'}elseif g~='1234567890abcdef'then return{status=500,
message='Decrypted data mismatch'}end return{status=200,message='Passed'}end end
function a.h()return function()local b=a.load'f'if not getfenv(0).crypt or not
getfenv(0).crypt.generatekey then return{status=400,message='Global not found'}
end local c=b.Decode(crypt.generatekey())if type(c)~='string'then return{status=
500,message='Generated key is not a string'}elseif#c~=32 then return{status=500,
message="Key dosen't match the expected length"}end return{status=200,message=
'Passed'}end end function a.i()return function()local b=a.load'f'if not getfenv(
0).crypt or not getfenv(0).crypt.generatebytes then return{status=400,message=
'Global not found'}end local c=math.random(1,512)local d=crypt.generatebytes(c)
local e=b.Decode(d)if type(e)~='string'then return{status=500,message=
'Generated bytes is not a string'}elseif#e~=c then return{status=500,message=
'Bytes length mismatch: '..tostring(#e)..' != '..tostring(c)}end return{status=
200,message='Passed'}end end function a.j()return function()if not getfenv(0).
crypt or not getfenv(0).crypt.hash then return{status=400,message=
'Global not found'}end local b,c='MYRIAD',{md5=
[[4f4c0116fe2faa1318448c548b35db329d04b95d6a564c9952674be7470292a8]],sha1=
[[fc7f43037330bdab9a8a3b19a7cbcde1ca35f0f3413e8109f2378d448e09d746]],sha224=
[[c289f37be9147ea83aea5178831674ac35512679c9ac728b0af58d1354aa9586]],sha256=
[[c9d5cae0702443d77159a3da3993a31e21fe71347946e8088e29c329b2fad67d]],sha384=
[[75805da0851cdb609be9cce35c7cf9b8c560fe1d015370d9ffdc7dc974cec3d2]],sha512=
[[9e5a7723b2776d0a26cfc7a1ee141ee7e23ab9be07a7bbe9a83ad9a44d6c932c]],['sha3-256'
]=[[508c76d7f914e8f434b11c84fa5c55a086f86b8b0b38ce0dffa861fdfbdc77b3]],[
'sha3-384']=[[1fb780f81b5a6013af2bfe6677a34439970c63b8447a00e0c23c0e5ff1a4bbd2]]
,['sha3-512']=
[[bc49e307d6fd0fc8f9ab5c9236ea93194dfa99dd89fea20e75aed6530bd6820b]]}for d,e in
pairs(c)do local f,g=pcall(crypt.hash,b,d)if not f then return{status=500,
message=`Hashing failed with {d}: {g}`}elseif not g then return{status=500,
message=`Hashing failed, expected a hash. Algorithm: {d}`}elseif g~=e then
return{status=500,message=`Hash mismatch. Algorithm: {d}`}end end return{status=
200,message='Passed'}end end function a.k()return function()if not getfenv(0).
crypt or not getfenv(0).crypt.random then return{status=400,message=
'Global not found'}end local b,c=pcall(function()return crypt.random(513)end)
local d,e=pcall(function()return crypt.random(-1)end)local f,g=pcall(function()
return crypt.random(64)end)if not f then return{status=500,message='Failed: '..
tostring(g)}elseif d then return{status=500,message=
'Arg[1] passed -1, should have failed.'}elseif b then return{status=500,message=
'Arg[1] passed 513, should have failed.'}elseif#g~=64 then return{status=500,
message='Len mismatch. Expected 64, got: '..tostring(#g)}end return{status=200,
message='Passed'}end end function a.l()return function()local b=a.load'f'if not
getfenv(0).crypt or not getfenv(0).crypt.base64encode then return{status=400,
message='Global not found'}end local c='MYRIAD'local d=crypt.base64encode(c)if
not d or typeof(d)~='string'then return{status=500,message=
'Did not return the expected type'}elseif d~=b.Encode(c)then return{status=500,
message='Encoded data mismatch'}end return{status=200,message='Passed'}end end
function a.m()return function()local b=a.load'f'if not getfenv(0).crypt or not
getfenv(0).crypt.base64decode then return{status=400,message='Global not found'}
end local c='MYRIAD'local d=b.Encode(c)local e=crypt.base64decode(d)if not d or
typeof(d)~='string'then return{status=500,message='Reference crypt failed ):'}
elseif not e or typeof(e)~='string'then return{status=500,message=
'Did not return the expected type'}elseif e~=c then return{status=500,message=
'Decoded data mismatch'}end return{status=200,message='Passed'}end end function
a.n()return function()if not getfenv(0).getrenderproperty then return{status=400
,message='Global not found'}elseif not getfenv(0).Drawing and getfenv(0).Drawing
.new then return{status=400,message='Drawing library needed to test this'}end
local b=Drawing.new'Line'b.Thickness=2 b.Visible=false local c,d=
getrenderproperty(b,'Thickness'),getrenderproperty(b,'Visible')if c~=2 or d~=
false then return{status=500,message='Property not found or mismatch'}end return
{status=200,message=`Passed`}end end function a.o()return function()if not
getfenv(0).setrenderproperty then return{status=400,message='Global not found'}
elseif not getfenv(0).Drawing and getfenv(0).Drawing.new then return{status=400,
message='Drawing library needed to test this'}end local b=Drawing.new'Line'
setrenderproperty(b,'Thickness',2)setrenderproperty(b,'Visible',false)if b.
Thickness~=2 or b.Visible~=false then return{status=500,message=
'Incorrect property value'}end return{status=200,message=`Passed`}end end
function a.p()return function()if not getfenv(0).cleardrawcache then return{
status=400,message='Global not found'}elseif not getfenv(0).Drawing and getfenv(
0).Drawing.new then return{status=400,message=
'Drawing library needed to test this'}end local b=Drawing.new'Line'b.Visible=
false b.Thickness=2 cleardrawcache()if b.__OBJECT_EXISTS then return{status=500,
message='Drawing exists after draw clear'}end return{status=200,message=`Passed`
}end end function a.q()return function()if not getfenv(0).gethui then return{
status=400,message='Global not found'}end local b=gethui()if not(b:IsA'Folder'or
b:IsA'BasePlayerGui')then return{status=500,message=
'hidden container is not a Folder or BasePlayerGui'}elseif b==game:GetService
'CoreGui'then return{status=500,message='Container cannot be uncloned CoreGui'}
end return{status=200,message=`Passed`}end end function a.r()return function()if
not getfenv(0).islclosure then return{status=400,message='Global not found'}end
local b,c=function()return 1 end,print if not islclosure(b)then return{status=
500,message='Failed to identify lua closure'}elseif islclosure(c)then return{
status=500,message='Identified C closure as lua closure'}end return{status=200,
message=`Passed`}end end function a.s()return function()if not getfenv(0).
iscclosure then return{status=400,message='Global not found'}end local b,c,d=
function()return 1 end,print,newcclosure(function()return 1 end)if iscclosure(b)
then return{status=500,message='Lua closure identified as C closure'}elseif not
iscclosure(c)then return{status=500,message=
'C closure not identified as C closure'}elseif not iscclosure(d)then return{
status=500,message='C closure not identified as C closure'}end return{status=200
,message=`Passed`}end end function a.t()return function()if not getfenv(0).
identifyexecutor then return{status=400,message='Global not found'}end local b,c
=identifyexecutor()if not b or not c then return{status=500,message=`Did not return expected data (executor, version)`
}elseif type(b)~='string'or type(c)~='string'then return{status=500,message=`Expected [string, string] got [{
b}, {c}]`}end return{status=200,message=`Passed ({b}, {c})`}end end function a.u
()return function(b)local c,d,e,f,g=0,0,0,{success='\u{2705}',fail='\u{274c}',
warn='\u{26a0}\u{fe0f}',bullet='\u{2022}'}local h,i={[200]=f.success,[400]=f.
fail,[500]=f.warn},{['crypt.encrypt']=a.load'e',['crypt.decrypt']=a.load'g',[
'crypt.generatekey']=a.load'h',['crypt.generatebytes']=a.load'i',['crypt.hash']=
a.load'j',['crypt.random']=a.load'k',['crypt.base64encode']=a.load'l',[
'crypt.base64decode']=a.load'm',getrenderproperty=a.load'n',setrenderproperty=a.
load'o',cleardrawcache=a.load'p',gethui=a.load'q',islclosure=a.load'r',
iscclosure=a.load's',identifyexecutor=a.load't'}for j in next,i do c+=1 g=j end
print(`{b}\n`)for j,k in next,i do local l,m=pcall(k)if not l then warn(`{f.
bullet} {h[400]} {j}: {m} {g==j and'\n'or''}`)e+=1 continue elseif m.status==200
then print(`{f.bullet} {h[m.status]} {j}: {m.message} {g==j and'\n'or''}`)d+=1
else warn(`{f.bullet} {h[m.status]} {j}: {m.message} {g==j and'\n'or''}`)e+=1
end end print(`Summary:`)print(`{f.bullet} Tested: {c}`)print(`{f.bullet} Passed: {
d}`)print(`{f.bullet} Failed: {e}`)print(`{f.bullet} Pass Rate: {d/c*100}%`)
return{passed=d,failed=e}end end function a.v()return function(b)print(`{b}\n`)
end end end local b,c,d={['Identity Validity']=a.load'a',[
'Standards Naming & Output Conventions']=a.load'u',['Vulnerability Mitigation']=
a.load'v'},{},{bullet='\u{2022}',section1=
'~~~~~~~~~~~~~~~~~~~~~~~~~ TESTS ~~~~~~~~~~~~~~~~~~~~~~~~~',section2=
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~',section3=
'\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}'
}print'Myriad General Validity Test (2025)'print(`Executor: {identifyexecutor
and identifyexecutor()or'Unknown'}\n`)print'Contributors:'print(`{d.bullet} biggaboy212\n`
)print(d.section1..'\n')for e,f in pairs(b)do c[e]=f(e)if e~=
'Vulnerability Mitigation'then print(d.section3..'\n')end end print(d.section2)
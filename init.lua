file.remove("init.lua")
file.open("init.lua","w")
file.writeline([[print("Successful Boot")]])
file.writeline([[wifi.setmode(wifi.STATION)]])
file.writeline([[wifi.sta.config("REDACTED","REDACTED")]])
file.writeline([[wifi.sta.connect()]])
file.writeline([[print("Connecting to AP")]])
file.writeline([[tmr.delay(3000)]])
file.writeline([[print(wifi.sta.getip())]])
file.close()


tmr.delay()

-- a simple telnet server
file.remove("telnet.lua")
file.open("telnet.lua","w")
file.writeline([[s=net.createServer(net.TCP,180)]])
file.writeline([[s:listen(2323,function(c)]])
file.writeline([[function s_output(str)]])
file.writeline([[if(c~=nil)]])
file.writeline([[then c:send(str)]])
file.writeline([[end]])
file.writeline([[end]])
file.writeline([[node.output(s_output, 0)]])
file.writeline([[c:on("receive",function(c,l)]])
file.writeline([[node.input(l)]])
file.writeline([[end)]])
file.writeline([[c:on("disconnection",function(c)]])
file.writeline([[node.output(nil)]])
file.writeline([[end)]])
file.writeline([[print("Welcome to NodeMcu world.")]])
file.writeline([[end)]])
file.writeline([[print("Telnet Running")]])
file.close()
node.restart()
dofile("telnet.lua")

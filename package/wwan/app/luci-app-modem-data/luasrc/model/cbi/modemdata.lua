mp = Map("modemdata")
mp.title = translate("Mobile Data")

s = mp:section(TypedSection, "service", translate("Settings"))
s.anonymous = true

enabled = s:option(Flag, "enabled", translate("Enable"))
enabled.default = 0
enabled.rmempty = false

ipv6 = s:option(Flag, "ipv6", translate("Enable IPv6 negotiation"))
ipv6.default = ipv6.disabled

failover = s:option(Flag, "fallover", translate("Network Failover"))
failover.default = 0
failover.rmempty = true


custom = s:option(Flag, "custom", translate("Custom Settings"))
custom.default = 0
custom.rmempty = true

device = s:option(Value, "device", translate("Dial Interface"))
device:depends("custom", "1")
device.rmempty = true

local net = require "luci.model.network".init()
local ifaces = net:get_interfaces()

for _, iface in ipairs(ifaces) do
	device:value(iface:name())
end

apn = s:option(Value, "apn", translate("APN"))
apn:depends("custom", "1")
apn:value("3gnet", translate("China Unicom"))
apn:value("cmnet", translate("China Mobile"))
apn:value("ctnet", translate("China Telecom"))
apn.rmempty = true

username = s:option(Value, "username", translate("PAP/CHAP username"))
username:depends("custom", "1")
username.rmempty = true

password = s:option(Value, "password", translate("PAP/CHAP password"))
password:depends("custom", "1")
password.rmempty = true

auth = s:option(Value, "auth", translate("Authentication Type"))
auth:depends("custom", "1")
auth:value("none", "NONE")
auth:value("both", "PAP/CHAP (both)")
auth:value("pap", "PAP")
auth:value("chap", "CHAP")
auth.rmempty = true

return mp

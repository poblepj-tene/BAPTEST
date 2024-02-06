module("luci.controller.modemdata", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/modemdata") then
		return
	end

	entry({"admin", "modem"}, firstchild(), _("Modem"), 25).dependent=false
	entry({"admin", "modem", "modemdata"}, cbi("modemdata"), _("Mobile Data"), 20).dependent = true
end

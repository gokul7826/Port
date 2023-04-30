-- Load necessary libraries
local nmap = require("nmap")
local socket = require("socket")

-- Define script information
local portscan = {
  name = "myportscan",
  author = "gokul",
  categories = {"discovery", "safe"}
}
portscan.description = [[
This is a sample script for port scanning using LuaSocket library's tcp.connect function.
]]

-- Define port scanning rule
portscan.portrule = function(host, port)
  return port.protocol == "tcp" and port.state == "open"
end

-- Define port scanning action
portscan.action = function(host, port)
  local client = nmap.new_socket()
  local result = client:connect(host, port)
  if result then
    print("Port " .. port.number .. " is open.")
  else
    print("Port " .. port.number .. " is closed.")
  end
  client:close()
end

-- Register the script with Nmap
return portscan

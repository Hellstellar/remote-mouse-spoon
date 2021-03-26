--- === RemoteMouse ===
---
--- Control your mouse with mobile
---
--- Requirements
--- - [Remote mouse server](https://github.com/Hellstellar/remote-mouse-server)
--- - Remote mouse mobile
--- Download: [https://github.com/Hellstellar/remote-mouse-spoon/archive/refs/heads/main.zip](https://github.com/Hellstellar/remote-mouse-spoon/archive/refs/heads/main.zip)

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "RemoteMouse"
obj.version = "0.1"
obj.author = "hellstellar <soorajdube.is@gmail.com>"
obj.license = "MIT - https://opensource.org/licenses/MIT"


--- RemoteMouse.port
--- Variable
--- Port where remote mouse server's websocket is running. Defaults to `4444`.
obj.port = "4444"

local websocketServerUrl =  "http://localhost:" .. obj.port .. "/?clientName=Hammerspoon"


local function getCoordinates(message)
    coordinates = {}
    for coordinate in message:gmatch("-?%w+") do
        table.insert(coordinates, coordinate)
    end
    return coordinates
end

local function connection(status, message)
    if status == "open" then hs.alert.show('Connected to remote mouse') end
    if status == "fail" then hs.alert.show('Connection to remote mouse failed') end

    if message ~= nil then
        local coordinates = getCoordinates(message)
        local currentPosition = hs.mouse.absolutePosition()
        local finalPositionX = currentPosition.x + tonumber(coordinates[1])
        local finalPositionY = currentPosition.y + tonumber(coordinates[2])
        local mousePosition = hs.geometry.point(finalPositionX, finalPositionY)
        hs.mouse.absolutePosition(mousePosition)
    end
end

--- RemoteMouse:start()
--- Method
--- Start Remote Mouse
function obj:start()
    hs.websocket.new(websocketServerUrl, connection)
end

return obj




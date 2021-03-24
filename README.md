# Remote Mouse Spoon
Spoon for hammerspoon to control mouse via mobile.

## Requirements:
- Hammerspoon
- [Remote mouse server](https://github.com/Hellstellar/remote-mouse-server)

## Get Started
Once you have downloaded the [Remote Mouse spoon](https://github.com/Hellstellar/remote-mouse-spoon/archive/refs/heads/main.zip):
- Make sure Remote Mouse Server is running.
- Extract the folder
- Open `RemoteMouse.spoon`, hammerspoon will automatically install the spoon.
- Open hammerspoon config(init.lua) and the following code:
  
    To import spoon
  
    `remoteMouse = hs.loadSpoon("RemoteMouse")`
    
    To start remote mouse
  
    `remoteMouse:start()`
- Reload the config and you are ready to go!!.
  
## Additional configuration
If you are running the Remote Mouse Websocket Server on a port other than the default port `4444`(You can find this in `.env` file).

You can modify the `remoteMouse.port = #port-number`
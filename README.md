# TurtSocket
A proof of concept websocket used to control ComputerCraft turtles

`server.js` is the JavaScript websocket server because Python for some reason has some issues hosting

`client.py` is the Python client you use to control and connect to the turtle

`startup.lua` goes into the turtle and is what is used to connect it all together

You will need to follow [this](https://tweaked.cc/guide/local_ips.html) guide if you plan on localhosting it as ComputerCraft does not allow it by default

## Commands
You can control what the turtle does with a few preprogrammed commands sent from the client.py. 
- forward, back, up, down: Move the turtle in the desired direction
- left, right: Turn the turtle in the desired direction
- mine, mineup, minedown: Mine blocks in the desired direction
- place, placeup, placedown: Place blocks in the desired direction

The turtle will try to automatically refuel if there is coal or a burnable item in its inventory when it hits 0 fuel

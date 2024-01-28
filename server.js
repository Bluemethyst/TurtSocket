const socket = require("ws")
var clients = []
const webSocket = new socket.Server({port:2024})

webSocket.on("connection", wsClient => {

    console.log("Something connected")
    clients.push(wsClient)

    wsClient.on("message", messageData => {
        
        console.log("Received Message: "+messageData.toString())
        //console.log(clients)

        clients.forEach(function(client){
            var jsonData = JSON.stringify(messageData.toString(), null, 4)
            client.send(messageData.toString())
        })

    })

    wsClient.on("close", () => {
        console.log("Something Disconnected")
    })
    
})
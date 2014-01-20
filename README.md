# aerogear-js-hornetq-stomp-websockets-chat
> Sample example which uses the [AeroGear JS](https://github.com/aerogear/aerogear-js) STOMP over WebSockets Notifier

## Getting Started
Execute: `./wildfly/server.sh`

The above command:

* Downloads the WildFly v8.0.0.CR1
* Starts the server
* Adds an [HornetQ](https://github.com/hornetq/hornetq) acceptor to let WildFly accept STOMP frames on a socket
* Adds a JMS topic
* Adds an application management user

Open the `aerogear-chat/index.html` in multiple tabs of your web browser and exchange real time messages.

You can stop the server by executing: `./wildfly/server.sh stop`

## Notes
The client side part is based on the chat example included in the [stomp-websockets](https://github.com/hornetq/hornetq/tree/master/examples/jms/stomp-websockets) HornetQ examples and has been modified to use the AeroGear STOMP over WebSockets Notifier.


A Nebraska server has a private world and some collection of clients.  It associates a RemoteControlledHand for each client.  Redraw events in the world are broadcasted to all connected clients.  A Nebraska server can listen on a TCP/IP port and accept new clients. Current version has been modified so that the server serves the world in which it was launched. Other variations are certainly possible.

To start a server, execute the following code:
	NebraskaServerMorph serveWorld: World

To start a client, run the following in another image:
	NetworkTerminalMorph openAndConnectTo: 'servername'

Fill in your server's hostname for 'servername'. At this point, everything should be working!

Before starting a server, you can tweak these:
BufferedCanvas enabled: false.
BufferedCanvas enabled: true.

At any time you can do these:
NebraskaDebug beginStats
NebraskaDebug showStats
NebraskaDebug showStats: #delays
NebraskaDebug showStats: #bigImage
NebraskaDebug showStats: #FormEncodeTimes
NebraskaDebug killStats

NOTE: if you want to have a local view of the server, you shouldn't use the TCP connections. The problem is that the server will occasionally do a #flush, and it won't work due to single threading. The better solution is to use a LoopBackStringSocket instead of a regular StringSocket, but there is no handy method for that right now....



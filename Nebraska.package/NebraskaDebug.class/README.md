BufferedCanvas enabled: false.
BufferedCanvas enabled: true.

NebraskaDebug beginStats
NebraskaDebug showStats
NebraskaDebug stopAndShowAll
NebraskaDebug killStats
StringSocket showRatesSeen
StringSocket clearRatesSeen
NebraskaDebug showAndClearStats: #allStats
NebraskaDebug showAndClearStats: #queuedbufferSizes


CanvasEncoder beginStats
CanvasEncoder showStats
CanvasEncoder killStats
NebraskaDebug showStats: #peerBytesSent
NebraskaDebug showStats: #soundReductionTime
NebraskaDebug showStats: #FormEncodeTimes
NebraskaDebug showStats: #SendReceiveStats
NebraskaDebug showStats: #sendDeltas
NebraskaDebug showStats: #bigImage
NebraskaDebug showStats: #sketch
NebraskaDebug showStats: #addToOutBuf:
----
buffered off, painting 125kb/s, dragging 400kb/s
buffered on, painting 100kb/s, dragging 170kb/s
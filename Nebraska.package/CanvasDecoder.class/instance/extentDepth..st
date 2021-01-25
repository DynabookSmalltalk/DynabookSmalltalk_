decoding
extentDepth: command 
	| depth extent |
	extent := self class decodePoint: (command second).
	depth := self class decodeInteger: (command third).
	drawingCanvas := FormCanvas extent: extent depth: depth
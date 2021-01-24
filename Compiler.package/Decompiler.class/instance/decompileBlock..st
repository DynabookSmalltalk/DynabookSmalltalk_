public access
decompileBlock: aBlock 
	"Decompile aBlock, returning the result as a BlockNode.  
	Show temp names from source if available."
	"Decompiler new decompileBlock: [3 + 4]"
	aBlock method decompileWithTemps
		ifNil: [^nil]
		ifNotNil:
			[:methodNode|
			 methodNode nodesDo:
				(aBlock isFullBlock
					ifTrue: [[:node| (node pc isVariableBinding and: [node pc key = aBlock method]) ifTrue: [^node]]]
					ifFalse: [[:node| node pc = aBlock startpc ifTrue: [^node]]])].
	 ^self error: 'cannot find block node matching aBlock'
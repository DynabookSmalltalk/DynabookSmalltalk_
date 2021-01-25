private
allButShebangLine: contentsString
	"If contentsString begins with '#!' then assume that it contains a Unix
	shebang line should be skipped prior to evaluating the contents."
	
	(contentsString beginsWith: '#!')
		ifTrue: [contentsString lineIndicesDo: [:line :end :endOfLine |
			^ contentsString allButFirst: endOfLine ]]
		ifFalse: [^ contentsString]

	" CodeLoader new allButShebangLine:
'#!/usr/llocal/bin/squeak --
Transcript cr; show: ''Hello world!''
' "
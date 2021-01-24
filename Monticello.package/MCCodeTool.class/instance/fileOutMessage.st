menus
fileOutMessage
	"Put a description of the selected message on a file"

	| fileName |
	self selectedMessageName ifNotNil:
		[Cursor write showWhile:
			[self selectedClassOrMetaClass fileOutMethod: self selectedMessageName].
		 ^self].
	items isEmpty ifTrue:
		[^self].
	fileName := UIManager default saveFilenameRequest: 'File out on which file?' initialAnswer: 'methods'.
	fileName isEmptyOrNil ifTrue: [^self].
	Cursor write showWhile:
		[| definitionStream removalInitStream |
		definitionStream := WriteStream on: (String new: 1000).
		removalInitStream := WriteStream on: (String new: 100).
		definitionStream header; timeStamp.
		items do:
			[:patchOp| | def |
			def := patchOp definition.
			def isMethodDefinition ifTrue:
				[(def actualClass notNil
				  and: [def actualClass includesSelector: def selector])
					ifTrue:
						[def actualClass
							printMethodChunk: def selector
							withPreamble: true
							on: definitionStream
							moveSource: false
							toFile: nil.
						(def selector == #initialize and: [def classIsMeta]) ifTrue:
							[removalInitStream nextChunkPut: def className, ' initialize'; cr]]
					ifFalse:
						[removalInitStream nextChunkPut: def className, (def classIsMeta ifTrue: [' class'] ifFalse: ['']), ' removeSelector: ', def selector printString; cr]].
			def isClassDefinition ifTrue:
				[def actualClass
					ifNotNil:
						[definitionStream nextChunkPut: def actualClass definition.
						 def comment ifNotNil:
							[def actualClass organization
								putCommentOnFile: definitionStream
								numbered: 1
								moveSource: false
								forClass: def actualClass]]
					ifNil:
						[removalInitStream nextChunkPut: def className, ' removeFromSystem'; cr]]].
		definitionStream nextPutAll: removalInitStream contents.
		FileStream writeSourceCodeFrom: definitionStream baseName: fileName isSt: true useHtml: false]
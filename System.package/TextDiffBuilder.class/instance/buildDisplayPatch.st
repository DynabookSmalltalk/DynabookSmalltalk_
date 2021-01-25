creating patches
buildDisplayPatch

	| stream result |
	stream := AttributedTextStream new.
	
	"Lazy initialize the text attributes cache."
	NormalTextAttributes ifNil: [NormalTextAttributes := self userInterfaceTheme normalTextAttributes
		ifNil: [{TextEmphasis normal}]].
	InsertTextAttributes ifNil: [InsertTextAttributes := self userInterfaceTheme insertTextAttributes
		ifNil: [{TextColor red}]].
	RemoveTextAttributes ifNil: [RemoveTextAttributes := self userInterfaceTheme removeTextAttributes
		ifNil: [{TextEmphasis struckOut. TextColor blue}]].
	
	self 
		patchSequenceDoIfMatch: [ :string |
			self print: string withAttributes: NormalTextAttributes on: stream ]
		ifInsert: [ :string |
			self print: string withAttributes: InsertTextAttributes on: stream ]
		ifRemove: [ :string |
			self print: string withAttributes: RemoveTextAttributes on: stream ].
	result := stream contents.
	(result notEmpty
	and: [result last = Character cr
	and: [(self lastIsCR: xLines) not
	and: [(self lastIsCR: yLines) not]]]) ifTrue:
		[result := result allButLast].
	^result
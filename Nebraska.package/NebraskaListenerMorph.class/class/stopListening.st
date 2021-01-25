as yet unclassified
stopListening
	GlobalListener ifNotNil:
		[GlobalListener stopListening.
		GlobalListener := nil.
		self bumpUpdateCounter]

	"EToyListenerMorph stopListening"
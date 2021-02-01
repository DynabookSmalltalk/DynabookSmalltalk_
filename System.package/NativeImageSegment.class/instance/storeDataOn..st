fileIn/Out
storeDataOn: aDataStream
	"Don't wrote the array of Roots.  Also remember the structures of the classes of objects inside the segment."

	| tempRoots tempOutP list |
	state = #activeCopy ifFalse: [self error: 'wrong state'].
		"real state is activeCopy, but we changed it will be right when coming in"
	tempRoots := arrayOfRoots.
	tempOutP := outPointers.
	outPointers := outPointers shallowCopy.
	self prepareToBeSaved.
	arrayOfRoots := nil.
	state := #imported.
	super storeDataOn: aDataStream.		"record my inst vars"
	arrayOfRoots := tempRoots.
	outPointers := tempOutP.
	state := #activeCopy.
	aDataStream references at: #AnImageSegment put: false.	"the false is meaningless"
		"This key in refs is the flag that there is an ImageSegment in this file."

	"Find the receivers of blocks in the segment.  Need to get the structure of their classes into structures.  Put the receivers into references."
	(aDataStream byteStream isKindOf: DummyStream) ifTrue: [
		list := Set new.
		arrayOfRoots do: [:ea | 
			ea isBlock | (ea class == Context) ifTrue: [ 
				list add: ea receiver class ]].
		aDataStream references at: #BlockReceiverClasses put: list].
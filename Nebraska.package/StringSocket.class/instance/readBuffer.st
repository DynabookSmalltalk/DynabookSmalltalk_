as yet unclassified
readBuffer

	^ readBuffer ifNil: [readBuffer := String new: 20000].

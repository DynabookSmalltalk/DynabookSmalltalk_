private
createByteArrayMap
	^ (0 to: 255)
		collect: [:i | (self includesCode: i) ifTrue: [1] ifFalse: [0]]
		as: ByteArray
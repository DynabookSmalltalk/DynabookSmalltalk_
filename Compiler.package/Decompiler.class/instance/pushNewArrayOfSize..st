instruction decoding
pushNewArrayOfSize: size
	stack addLast: #pushNewArray -> (Array new: size)
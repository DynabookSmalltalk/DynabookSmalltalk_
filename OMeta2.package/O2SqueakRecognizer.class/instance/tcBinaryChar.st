rules-lexing
tcBinaryChar =

	char:x ?[(TypeTable at: x asciiValue) == #xBinary]
private
isOfSameSizeCheck: otherCollection

	otherCollection size = self size ifFalse: [self errorDifferentSize]
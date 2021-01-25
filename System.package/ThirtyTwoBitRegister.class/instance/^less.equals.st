comparing
<= aThirtyTwoBitRegister

	^hi < aThirtyTwoBitRegister hi or: [
		hi = aThirtyTwoBitRegister hi and: [
			low <= aThirtyTwoBitRegister low ] ]
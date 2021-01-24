accessing
thresholdForMul33
	<preference: 'Threshold for multiplication by 3-way Toom-Cook'
		category: 'Arithmetic'
		description: 'The number of byte-digit above which 3-way Toom-Cook is more efficient than Karatsuba'
		type: #Number>
	^ThresholdForMul33 ifNil: [2000]
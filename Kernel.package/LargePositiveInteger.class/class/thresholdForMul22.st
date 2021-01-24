accessing
thresholdForMul22
	<preference: 'Threshold for multiplication by 2-way Karatsuba'
		category: 'Arithmetic'
		description: 'The number of byte-digit above which Karatsuba is more efficient than schoolbook'
		type: #Number>
	^ThresholdForMul22 ifNil: [600]
accessing
thresholdForSquaredByHalf
	<preference: 'Threshold for squaring by 2-way Karatsuba'
		category: 'Arithmetic'
		description: 'The number of byte-digit above which Karatsuba squaring is more efficient than schoolbook multiplication'
		type: #Number>
	^ThresholdForSquaredByHalf ifNil: [400]
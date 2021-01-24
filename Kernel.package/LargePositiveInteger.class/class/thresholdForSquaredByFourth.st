accessing
thresholdForSquaredByFourth
	<preference: 'Threshold for squaring by 4-way Toom-Cook'
		category: 'Arithmetic'
		description: 'The number of byte-digit above which 4-way Toom-Cook squaring is more efficient than Karatsuba'
		type: #Number>
	^ThresholdForSquaredByFourth ifNil: [800]
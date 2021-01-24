accessing
thresholdForDiv21
	<preference: 'Threshold for division by Burnikel-Ziegler recursive split'
		category: 'Arithmetic'
		description: 'The number of byte-digit above which recursive division is more efficient than schoolbook division'
		type: #Number>
	^ThresholdForDiv21 ifNil: [256]
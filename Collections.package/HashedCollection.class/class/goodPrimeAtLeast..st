sizing
goodPrimeAtLeast: lowerLimit
	"Answer the smallest good prime >= lowerlimit.
	If lowerLimit is larger than the largest known good prime, just make it odd.
	Use linear search, and exponential search to speed up cases when lowerLimit is small (<2500 and <100000, respectively).
	Assume that there are goodPrimes greater than 100000."
	
	| highIndex midIndex lowIndex prime |
	lowerLimit < 2500 ifTrue: [
		"Use linear search when the limit is small. The boundary is based on measurements."
		highIndex := 1.
		[ (GoodPrimes at: highIndex) < lowerLimit ] whileTrue: [
			highIndex := highIndex + 1 ].
		^GoodPrimes at: highIndex ].
	lowerLimit < 100000 
		ifTrue: [
			"Use exponential search when the limit is not too large. The boundary is based on measurements."
			highIndex := 1.
			[ (GoodPrimes at: highIndex) < lowerLimit ] whileTrue: [
				highIndex := highIndex * 2 ].
			lowIndex := highIndex // 2 + 1. "highIndex // 2 was smaller than lowerLimit" ]
		ifFalse: [
			"Regular binary search."
			lowIndex := 1.
			highIndex := GoodPrimes size.
			"Check whether the largest prime would fit"
			(GoodPrimes at: highIndex) < lowerLimit ifTrue: [
				^lowerLimit bitOr: 1 ]. ].
	[ highIndex - lowIndex <= 1 ] whileFalse: [
		midIndex := highIndex + lowIndex // 2.
		prime := GoodPrimes at: midIndex.
		lowerLimit < prime
			ifTrue: [ highIndex := midIndex ]
			ifFalse: [
				lowerLimit > prime
					ifTrue: [ lowIndex := midIndex ]
					ifFalse: [ ^prime ] ] ].
	(GoodPrimes at: lowIndex) >= lowerLimit ifTrue: [ ^GoodPrimes at: lowIndex ].
	^GoodPrimes at: highIndex
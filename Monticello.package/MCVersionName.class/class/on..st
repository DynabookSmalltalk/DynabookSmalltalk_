instance creation
on: aString 
	"aString may be with or without a mc? extension."
	^ (self new: aString size)
		replaceFrom: 1
			to: aString size
			with: aString
			startingAt: 1 ;
		yourself
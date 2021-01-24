printing
printOn: aStream base: b nDigits: n
	"Append a representation of this number in base b on aStream using n digits.
	In order to reduce cost of LargePositiveInteger ops, split the number of digts approximatily in two
	Should be invoked with: 0 <= self < (b raisedToInteger: n)"
	
	| halfPower half head tail qr |
	n <= 1 ifTrue: [
		n <= 0 ifTrue: [self error: 'Number of digits n should be > 0'].
		
		"Note: this is to stop an infinite loop if one ever attempts to print with a huge base
		This can happen because choice was to not hardcode any limit for base b
		We let Character>>#digitValue: fail"
		^aStream nextPut: (Character digitValue: self) ].
	halfPower := n bitShift: -1.
	half := b raisedToInteger: halfPower.
	qr := self divideByInteger: half.
	head := qr first normalize.
	tail := qr last normalize.
	head printOn: aStream base: b nDigits: n - halfPower.
	tail printOn: aStream base: b nDigits: halfPower
as yet unclassified
showStats: queueName from: aCollection

	| answer prevTime |

	prevTime := nil.
	answer := String streamContents: [ :s | 
		s nextPutAll: (aCollection last first - aCollection first first) asStringWithCommas,' ms';cr;cr.
		aCollection withIndexDo: [ :each :index | | xx currTime | 
			(queueName == #allStats or: [queueName == each last]) ifTrue: [
				currTime := each first.
				xx := currTime printString.
				prevTime ifNil: [prevTime := currTime].
				s nextPutAll: index printString,'.  ',
					(xx allButLast: 3),'.',(xx last: 3),' ',(currTime - prevTime) printString,' '.
				s nextPutAll: each allButFirst printString; cr.
				prevTime := currTime.
			].
		]
	].
	StringHolder new 
		contents: answer;
		openLabel: queueName
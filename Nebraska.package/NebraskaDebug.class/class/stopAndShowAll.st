as yet unclassified
stopAndShowAll

	| prev |

self halt.	"not updated to new format"

	prev := DEBUG.
	DEBUG := nil.
	prev ifNil: [^Beeper beep].
	prev keysAndValuesDo: [ :k :v |
		self showStats: k from: v
	].
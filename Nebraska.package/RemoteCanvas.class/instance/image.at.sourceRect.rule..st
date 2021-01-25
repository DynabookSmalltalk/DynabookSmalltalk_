private
image: aForm at: aPoint sourceRect: sourceRect rule: rule
	"Draw the given form."
	self drawCommand: [ :executor |
		executor image: aForm at: aPoint sourceRect: sourceRect rule: rule
	].
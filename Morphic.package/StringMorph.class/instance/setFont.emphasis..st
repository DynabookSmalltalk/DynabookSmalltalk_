initialization
setFont: aFont emphasis: emphasisCode
	"self assert: emphasisCode = aFont emphasis."

	font := aFont.
	emphasis := emphasisCode.
	
	self fitContents.

"
in inspector say,
	 self font: (TextStyle default fontAt: 2) emphasis: 1
"
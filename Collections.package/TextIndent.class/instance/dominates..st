condensing
dominates: aTextAttribute
	"Indentation should replace any existing alignment or indentation."
	^ aTextAttribute isTextIndent
		or: [ aTextAttribute isTextAlignment ]
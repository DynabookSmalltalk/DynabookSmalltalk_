testing
dominates: other
	"Alignment dominates other alignments or indentations."
	^ other isTextAlignment or: [ other isTextIndent ]
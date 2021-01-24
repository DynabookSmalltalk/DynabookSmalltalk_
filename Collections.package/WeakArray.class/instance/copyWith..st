copying
copyWith: newElement 
	"Re-implemented to not return a strong copy."
	^ (super copyWith: newElement) as: self class
copying
copyWithout: oldElement 
	"Re-implemented to not return a strong copy."
	^ (super copyWithout: oldElement) as: self class
accessing
borderColor: aColor 
	"Recompute fillForm and borderForm if translucency of border changes."
	
	super borderColor: aColor.

	(self borderColor isColor and: [self borderColor isTranslucentColor]) 
		== (aColor isColor and: [aColor isTranslucentColor]) 
			ifFalse: [self releaseCachedState]
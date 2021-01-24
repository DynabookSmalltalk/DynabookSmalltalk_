ancestry
names
	"The names of the ancestors."
	^ self ancestors collect: [ : each | each name asMCVersionName ]
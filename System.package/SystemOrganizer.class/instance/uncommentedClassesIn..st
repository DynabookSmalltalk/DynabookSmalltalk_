query
uncommentedClassesIn: categoryName

	"SystemOrganization uncommentedClassesIn: 'Morphic*'"

	^ (self classesIn: categoryName) select: [:cls | cls hasComment not]
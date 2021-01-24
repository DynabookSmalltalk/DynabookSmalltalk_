user interface
openAndEditTemplateCopy
	^ self class fillInTheBlankConfigure: (self asCreationTemplate ifNil: [^nil])
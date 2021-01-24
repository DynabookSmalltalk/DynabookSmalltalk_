instance creation
definitions: aCollection

	^self basicNew
		initialize: aCollection size;
		addAll: aCollection;
		yourself
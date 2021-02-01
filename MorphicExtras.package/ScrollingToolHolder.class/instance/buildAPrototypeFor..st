initialize-release
buildAPrototypeFor: aPaintBoxMorph
	pickupButtons := (aPaintBoxMorph submorphNamed: 'stamps') submorphs select: [:e | e externalName = 'pickup:'].
	stampButtons := (aPaintBoxMorph submorphNamed: 'stamps') submorphs select: [:e | e externalName = 'stamp:'].
	stamps := OrderedCollection ofSize: 3.
	thumbnailPics := OrderedCollection ofSize: 3.
	start := 3.
as yet unclassified
mouseDownEvent: event for: aMorph 
	| menu selection depictedObject |
	depictedObject := aMorph firstSubmorph valueOfProperty: #depictedObject.
	menu := CustomMenu new.
	menu
		add: 'Grab' translated action: [event hand attachMorph: depictedObject veryDeepCopy];
		add: 'Delete' translated
			action: 
				[self class removeFromGlobalIncomingQueue: depictedObject.
				self rebuild].
	selection := menu build startUpCenteredWithCaption: 'Morph from ' translated
						, (aMorph submorphs second) firstSubmorph contents.
	selection ifNil: [^self].
	selection value
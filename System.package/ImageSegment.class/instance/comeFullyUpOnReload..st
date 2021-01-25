fileIn
comeFullyUpOnReload: smartRefStream
	"fix up the objects in the segment that changed size.  An object in the segment is the wrong size for the modern version of the class. Construct a fake class that is the old size.  Replace the modern class with the old one in outPointers.  Load the segment. Traverse the instances, making new instances by copying fields, and running conversion messages.  Keep the new instances.  Bulk forward become the old to the new.  Let go of the fake objects and classes.
	After the install (below), arrayOfRoots is filled in. Globalize new classes.  Caller may want to do some special install on certain objects in arrayOfRoots.
	May want to write the segment out to disk in its new form."

	| mapFakeClassesToReal receiverClasses rootsToUnhiberhate myProject existing forgetDoItsClass endianness |

	forgetDoItsClass := Set new.
	RecentlyRenamedClasses := nil.		"in case old data hanging around"
	mapFakeClassesToReal := smartRefStream reshapedClassesIn: outPointers.
		"Dictionary of just the ones that change shape. Substitute them in outPointers."
	self fixCapitalizationOfSymbols.
	endianness := self endianness.
	segment := self loadSegmentFrom: segment outPointers: outPointers.
	arrayOfRoots := segment first.
	mapFakeClassesToReal isEmpty ifFalse: [
		self reshapeClasses: mapFakeClassesToReal refStream: smartRefStream
	].
	"When a Project is stored, arrayOfRoots has all objects in the project, except those in outPointers"
	arrayOfRoots do: [:importedObject |
		((importedObject isMemberOf: WideString) or: [importedObject isMemberOf: WideSymbol]) ifTrue: [
			importedObject mutateJISX0208StringToUnicode.
			importedObject class = WideSymbol ifTrue: [
				"self halt."
				Symbol hasInterned: importedObject asString ifTrue: [:multiSymbol |
					multiSymbol == importedObject ifFalse: [
						importedObject becomeForward: multiSymbol.
					].
				].
			].
		].
		(importedObject isMemberOf: TTCFontSet) ifTrue: [
			existing := TTCFontSet familyName: importedObject familyName
						pointSize: importedObject pointSize.	"supplies default"
			existing == importedObject ifFalse: [importedObject becomeForward: existing].
		].
	].

	receiverClasses := self restoreEndianness: endianness ~~ Smalltalk endianness.		"rehash sets"
	smartRefStream checkFatalReshape: receiverClasses.

	"Classes in this segment."
	arrayOfRoots do: [:importedObject |
		importedObject class class == Metaclass ifTrue: [forgetDoItsClass add: importedObject. self  declare: importedObject]].
	rootsToUnhiberhate := OrderedCollection new.
	arrayOfRoots do: [:importedObject |
		((importedObject isMemberOf: ScriptEditorMorph)
			or: [(importedObject isKindOf: TileMorph)
				or: [(importedObject isMemberOf: ScriptingTileHolder)
					or: [importedObject isKindOf: CompoundTileMorph]]]) ifTrue: [
			rootsToUnhiberhate add: importedObject
		].
		(importedObject isMemberOf: Project) ifTrue: [
			myProject := importedObject.
			importedObject ensureChangeSetNameUnique.
			Project addingProject: importedObject.
			importedObject restoreReferences.
			self dependentsRestore: importedObject.
			ScriptEditorMorph writingUniversalTiles:
				((importedObject projectPreferenceAt: #universalTiles) ifNil: [false])]].

	myProject ifNotNil: [
		myProject world setProperty: #thingsToUnhibernate toValue: rootsToUnhiberhate asArray.
	].

	mapFakeClassesToReal isEmpty ifFalse: [
		mapFakeClassesToReal keysAndValuesDo: [:aFake :aReal |
			aFake removeFromSystemUnlogged.
			aFake becomeForward: aReal].
		SystemOrganization removeEmptyCategories].
	forgetDoItsClass do: [:c | c forgetDoIts].
	"^ self"

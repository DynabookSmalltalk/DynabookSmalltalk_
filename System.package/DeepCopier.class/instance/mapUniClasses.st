like fullCopy
mapUniClasses
	"For new Uniclasses, map their class vars to the new objects.  And their additional class instance vars.  (scripts slotInfo) and cross references like (player321)."
	"Players also refer to each other using associations in the References dictionary.  Search the methods of our Players for those.  Make new entries in References and point to them."
	| pp |

	newUniClasses ifFalse: [^ self].	"All will be siblings.  uniClasses is empty"
"Uniclasses use class vars to hold onto siblings who are referred to in code"
pp := (Smalltalk at: #Player ifAbsent:[^self]) class superclass instSize.
uniClasses do: [:playersClass | "values = new ones"
	playersClass classPool associationsDo: [:assoc |
		assoc value: (assoc value veryDeepCopyWith: self)].
	playersClass scripts: (playersClass privateScripts veryDeepCopyWith: self).	"pp+1"
	"(pp+2) slotInfo was deepCopied in copyUniClass and that's all it needs"
	pp+3 to: playersClass class instSize do: [:ii | 
		playersClass instVarAt: ii put: 
			((playersClass instVarAt: ii) veryDeepCopyWith: self)].
	].

"Make new entries in References and point to them."
References keys "copy" do: [:playerName | | oldPlayer newKey |
	oldPlayer := References at: playerName.
	(references includesKey: oldPlayer) ifTrue: [
		newKey := (references at: oldPlayer) "new player" uniqueNameForReference.
		"now installed in References"
		(references at: oldPlayer) renameTo: newKey]].
uniClasses "values" do: [:newClass | | newSelList oldSelList |
	oldSelList := OrderedCollection new.   newSelList := OrderedCollection new.
	newClass selectorsAndMethodsDo: [:sel :m | 
		m literals do: [:assoc | | newAssoc newKey |
			assoc isVariableBinding ifTrue: [
				(References associationAt: assoc key ifAbsent: [nil]) == assoc ifTrue: [
					newKey := (references at: assoc value ifAbsent: [assoc value]) 
									externalName asSymbol.
					(assoc key ~= newKey) & (References includesKey: newKey) ifTrue: [
						newAssoc := References associationAt: newKey.
						newClass methodDictionary at: sel put: 
							(newClass compiledMethodAt: sel) shallowCopy.	"were sharing it"
						(newClass compiledMethodAt: sel)
							literalAt: ((newClass compiledMethodAt: sel) literals indexOf: assoc)
							put: newAssoc.
						(oldSelList includes: assoc key) ifFalse: [
							oldSelList add: assoc key.  newSelList add: newKey]]]]]].
	oldSelList with: newSelList do: [:old :new |
			newClass replaceSilently: old to: new]].	"This is text replacement and can be wrong"
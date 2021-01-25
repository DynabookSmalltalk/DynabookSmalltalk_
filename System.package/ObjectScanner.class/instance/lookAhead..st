scanning
lookAhead: aChunk
	"See if this chunk is a class Definition, and if the new class name already exists and is instance-specific.  Modify the chunk, and record the rename in the SmartRefStream and in me."

	| pieces sup oldName existing newName newDefn |
	aChunk size < 90 ifTrue: [^ aChunk].		"class defn is big!"
	(aChunk at: 1) == $! ifTrue: [^ aChunk].	"method def, fast exit"
	pieces := (aChunk copyFrom: 1 to: (300 min: aChunk size)) findTokens: ' #	\' withCRs.
	pieces size < 3 ifTrue: [^ aChunk].	"really bigger, but just took front"
	(pieces at: 2) = 'subclass:' ifFalse: [^ aChunk].
	sup := Smalltalk at: (pieces at: 1) asSymbol ifAbsent: [^ aChunk].
	sup class class == Metaclass ifFalse: [^ aChunk].
	((oldName := pieces at: 3) at: 1) canBeGlobalVarInitial ifFalse: [^ aChunk].
	oldName := oldName asSymbol.
	(Smalltalk includesKey: oldName) ifFalse: [^ aChunk].	"no conflict"
	existing := Smalltalk at: oldName.
	(existing isKindOf: Class) ifFalse: [^ aChunk].	"Write over non-class global"
	existing isSystemDefined ifTrue: [^ aChunk].	"Go ahead and redefine it!"
	"Is a UniClass"
	newName := sup chooseUniqueClassName.
	newDefn := aChunk copyReplaceAll: oldName with: newName.
	Compiler evaluate: newDefn for: self logged: true.	"Create the new class"
	self rename: oldName toBe: newName.
	^ newName asString		"to be evaluated"

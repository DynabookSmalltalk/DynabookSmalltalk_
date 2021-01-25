testing
findOwnersOutPtrs

| ow ff |
ow := Smalltalk at: #Owners ifAbsent: [^ self].
ow ifNil: [^ self].
outPointers do: [:oo | 
	oo isMorph ifTrue: [
		ow := ow copyReplaceAll: oo printString with: oo printString, '[<<<- Pointed at]']].
ff := FileStream fileNamed: 'Owners log'.
ff nextPutAll: ow; close.
Smalltalk at: #Owners put: ow.
ff edit.
like fullCopy
checkBasicClasses
	"Check that no indexes of instance vars have changed in certain classes.  If you get an error in this method, an implementation of veryDeepCopyWith: needs to be updated.  The idea is to catch a change while it is still in the system of the programmer who made it.  
	DeepCopier new checkVariables	"

	| str str2 objCls morphCls playerCls |
	str := '|veryDeepCopyWith: or veryDeepInner: is out of date.'.
	(objCls := self objInMemory: #Object) ifNotNil: [
		objCls instSize = 0 ifFalse: [self error: 
			'Many implementers of veryDeepCopyWith: are out of date']].
	(morphCls := self objInMemory: #Morph) ifNotNil: [
		morphCls superclass == Object ifFalse: [self error: 'Morph', str].
		(morphCls instVarNames copyFrom: 1 to: 6) = #('bounds' 'owner' 'submorphs' 
				'fullBounds' 'color' 'extension') 
			ifFalse: [self error: 'Morph', str]].	"added ones are OK"

	str2 := 'Player|copyUniClassWith: and DeepCopier|mapUniClasses are out of date'.
	(playerCls := self objInMemory: #Player) ifNotNil: [
		playerCls class instVarNames = #('scripts' 'slotInfo' 'variableDocks')
			ifFalse: [self error: str2]].

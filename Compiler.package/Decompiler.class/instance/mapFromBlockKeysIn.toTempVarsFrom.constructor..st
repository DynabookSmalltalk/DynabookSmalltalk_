initialize-release
mapFromBlockKeysIn: aMethod toTempVarsFrom: schematicTempNamesString constructor: aDecompilerConstructor
	| startMap tempMap |
	startMap := aMethod startKeysToBlockExtents.
	tempMap := aMethod
					mapFromBlockKeys: (startMap keys asArray sort: [:a :b| (startMap at: a) first <= (startMap at: b) first])
					toSchematicTemps: schematicTempNamesString.
	tempMap keysAndValuesDo:
		[:startKey :tempNameTupleVector|
		tempNameTupleVector isEmpty ifFalse:
			[| subMap numTemps tempVector |
			subMap := Dictionary new.
			"Find how many temp slots there are (direct & indirect temp vectors)
			 and for each indirect temp vector find how big it is."
			tempNameTupleVector do:
				[:tuple|
				tuple last isArray
					ifTrue:
						[subMap at: tuple last first put: tuple last last.
						 numTemps := tuple last first]
					ifFalse:
						[numTemps := tuple last]].
			"create the temp vector for this scope level."
			tempVector := Array new: numTemps.
			"fill it in with any indirect temp vectors"
			subMap keysAndValuesDo:
				[:index :size|
				tempVector at: index put: (Array new: size)].
			"fill it in with temp nodes."
			tempNameTupleVector do:
				[:tuple| | itv |
				tuple last isArray
					ifTrue:
						[itv := tempVector at: tuple last first.
						 itv at: tuple last last
							put: (aDecompilerConstructor
									codeTemp: tuple last last - 1
									named: tuple first)]
					ifFalse:
						[tempVector
							at: tuple last
							put: (aDecompilerConstructor
									codeTemp: tuple last - 1
									named: tuple first)]].
			"replace any indirect temp vectors with proper RemoteTempVectorNodes"
			subMap keysAndValuesDo:
				[:index :size|
				tempVector
					at: index
					put: (aDecompilerConstructor
							codeRemoteTemp: index
							remoteTemps: (tempVector at: index))].
			"and update the entry in the map"
			tempMap at: startKey put: tempVector]].
	^tempMap
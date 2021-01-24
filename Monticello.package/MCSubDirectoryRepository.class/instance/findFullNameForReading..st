private
findFullNameForReading: aBaseName
	"Answer the latest version of aBaseName"
	| possible |
	possible := OrderedCollection new.
	self allDirectories
		do: [:dir | dir entries
				do: [:ent | ent isDirectory
						ifFalse: [
							(ent name = aBaseName) ifTrue: [ possible addLast: {ent. dir fullNameFor: ent name}]]]].
	possible isEmpty ifTrue: [ ^nil ].
	^(possible detectMin: [ :each | each first modificationTime ]) second
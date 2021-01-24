repository-api
versionNamesForPackageNamed: aString 
	^ repositories
		inject: Set new
		into:
			[ : set : each | set
				 addAll:
					([ each versionNamesForPackageNamed: aString ]
						on: NetworkError
						do: [ : err | Array empty ]) ;
				 yourself ]
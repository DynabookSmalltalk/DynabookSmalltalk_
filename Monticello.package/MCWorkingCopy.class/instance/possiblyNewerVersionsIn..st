private
possiblyNewerVersionsIn: aRepository 
	^ aRepository possiblyNewerVersionsOfAnyOf:
		((self ancestors collect: [:each | each versionName])
			ifEmpty: [Array empty]
			ifNotEmpty: [:ancestors | {ancestors detectMax: [:v | v versionNumber ]}])
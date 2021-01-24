versions
versionNamed: aMCVersionName 
	"For FileBased repositories, aMCVersionName must have the appropriate extension!  :-("
	| version |
	version := self cache
		at: aMCVersionName
		ifAbsent:
			[ [ self loadVersionFromFileNamed: aMCVersionName ]
				on: FileDoesNotExistException
				do: [ : err | nil ] ].
	self resizeCache: cache.
	(version notNil and: [ version isCacheable ]) ifTrue:
		[ cache
			at: aMCVersionName asMCVersionName
			put: version ].
	^ version
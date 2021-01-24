installing
scanForPreviousVersions
	"Answer change records for other versions of this method, i.e. other overrides and the original version"
	| versions |
	versions := OrderedCollection new.
	PackageInfo default changeRecordsForMethod: self asMethodReference do: [:record |
		record category = category ifFalse: [versions add: record]].
	^versions

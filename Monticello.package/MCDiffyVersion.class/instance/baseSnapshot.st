accessing
baseSnapshot
	| baseVersion |
	baseVersion := self workingCopy repositoryGroup versionWithInfo: base.
	baseVersion ifNil: [Error signal: 'Missing snapshot: ', self baseInfo name].
	^ baseVersion snapshot
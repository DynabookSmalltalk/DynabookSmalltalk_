private
basicStoreVersion: aVersion
	| url |
	url := self uploadVersion: aVersion.
	self releaseVersion: aVersion url: url
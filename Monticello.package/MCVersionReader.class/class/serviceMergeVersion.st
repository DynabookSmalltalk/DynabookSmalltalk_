*monticello-file services-override-override
serviceMergeVersion
	^ (SimpleServiceEntry
		provider: self
		label: 'merge version'
		selector: #mergeVersionStream:
		description: 'merge a package version into the image'
		buttonLabel: 'merge')
		argumentGetter: [ :fileList | fileList readOnlyStream ]
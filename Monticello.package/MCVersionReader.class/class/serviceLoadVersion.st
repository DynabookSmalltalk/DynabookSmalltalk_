*monticello-file services-override-override
serviceLoadVersion
	^ (SimpleServiceEntry
		provider: self
		label: 'load version'
		selector: #loadVersionStream:fromDirectory:
		description: 'load a package version'
		buttonLabel: 'load')
		argumentGetter: [ :fileList | { fileList readOnlyStream . fileList directory } ]
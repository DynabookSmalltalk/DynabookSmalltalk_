(PackageInfo named: 'Compiler') postscript: '"below, add code to be run after the loading of this package"
"Make sure that all those ``code generation (closures)'''' categoies disappear"
ParseNode withAllSubclasses do:
	[:pnc| pnc organization removeEmptyCategories]'!

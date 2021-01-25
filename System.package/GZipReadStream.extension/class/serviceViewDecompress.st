*System-FileRegistry
serviceViewDecompress

	^ SimpleServiceEntry 
				provider: self 
				label: 'view decompressed'
				selector: #viewContents:
				description: 'view decompressed' 

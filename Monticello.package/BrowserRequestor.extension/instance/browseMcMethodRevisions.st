*monticello-revisions
browseMcMethodRevisions
	"Open a browser on all versions of this method available in the MC repository for this package."
	self selectedMethodReference
		ifNil: [ UIManager inform: 'No method selected' ]
		ifNotNilDo:
			[ : methodReference | methodReference mcModel
				ifNil: [ UIManager inform: 'Only Magma-backed HTTP repositories (or MCMagmaRepositorys) support browsing Monticello revisions.' ]
				ifNotNil: [ (MCOperationsList operations: (Cursor wait showWhile: [ methodReference mcPatchOperations ])) browse ] ]
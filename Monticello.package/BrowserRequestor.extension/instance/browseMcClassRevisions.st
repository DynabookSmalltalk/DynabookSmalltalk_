*monticello-revisions
browseMcClassRevisions
	"Open a browser on all versions of this class available in the MC repository for this package."
	self getClass
		ifNil: [ UIManager inform: 'No class selected' ]
		ifNotNilDo:
			[ : theClass | theClass theNonMetaClass mcModel
				ifNil: [ UIManager inform: 'Only Magma-backed HTTP repositories (or MCMagmaRepositorys) support browsing Monticello revisions.' ]
				ifNotNil:
					[ : mcModel | (MCOperationsList operations: (Cursor wait showWhile: [ theClass theNonMetaClass mcPatchOperations ])) browse ] ]
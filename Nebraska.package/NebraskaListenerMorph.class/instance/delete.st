submorphs-add/remove
delete

	listener ifNotNil: [listener stopListening. listener := nil].	
					"for old instances that were locally listening"
	super delete.
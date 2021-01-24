configuring
morphicConfigure
	^ UIManager default chooseDirectory
		 ifNotNil: [:directory | self new directory: directory]
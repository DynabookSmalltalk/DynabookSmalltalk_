menus
classListMenu: aMenu 

	aMenu addList: #(
		-
		('browse full (b)'			browseMethodFull)
		('browse hierarchy (h)'		classHierarchy)
		('browse protocol (p)'		browseFullProtocol)
"		-
		('printOut'					printOutClass)
		('fileOut'					fileOutClass)
"		-
		('show hierarchy'			methodHierarchy)
"		('show definition'			editClass)
		('show comment'			editComment)
"
"		-
		('inst var refs...'			browseInstVarRefs)
		('inst var defs...'			browseInstVarDefs)
		-
		('class var refs...'			browseClassVarRefs)
		('class vars'					browseClassVariables)
		('class refs (N)'				browseClassRefs)
		-
		('rename class ...'			renameClass)
		('copy class'				copyClass)
		('remove class (x)'			removeClass)
"
		-
		('find method...'				findMethodInChangeSets)).
							
	^aMenu
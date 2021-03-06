*System-Files-error handling
fileExistsUserHandling: fullFileName ifDebug: debugBlock
	| dir localName choice newName newFullFileName |
	dir := FileDirectory forFileName: fullFileName.
	localName := FileDirectory localNameFor: fullFileName.
	choice := (UIManager default 
		chooseFrom: #('overwrite that file' 'append (risky!!)' 'choose another name' 'debug' 'cancel')
		title: localName, ' already exists.').

	choice = 1 ifTrue: [
		dir deleteFileNamed: localName
			ifAbsent: [self error: 'Could not delete the old version of that file'].
		^ self new open: fullFileName forWrite: true].

	choice = 2 ifTrue: [
		^ (self new open: fullFileName forWrite: true) setToEnd].

	choice = 3 ifTrue: [
		newName := UIManager default request: 'Enter a new file name' initialAnswer: fullFileName.
		newFullFileName := self fullName: newName.
		^ self newFileNamed: newFullFileName].

	choice = 4 ifTrue: [^ debugBlock value].

	self error: 'Please close this to abort file opening'
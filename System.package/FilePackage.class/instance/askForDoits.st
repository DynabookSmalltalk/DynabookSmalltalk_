fileIn/fileOut
askForDoits
	| choice choices |
	choices := #('do not process' 'at the beginning' 'at the end' 'cancel').
	choice := nil.
	[choices includes: choice] whileFalse: [
		choice := UIManager default chooseFrom: choices values: choices title:
'The package contains unprocessed doIts.
When would like to process those?'].
	^choices indexOf: choice
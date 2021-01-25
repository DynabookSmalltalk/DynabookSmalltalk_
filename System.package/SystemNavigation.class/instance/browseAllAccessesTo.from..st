browse
browseAllAccessesTo: instVarName from: aClass
	"Create and schedule a Message Set browser for all the receiver's methods or any methods of a subclass/superclass that refer to the instance variable name."
	"self new browseAllAccessesTo: 'contents' from: Collection."
	
	^ self 
		browseMessageList: [ (self allAccessesTo: instVarName from: aClass) sort ]
		name: ('Accesses to {1} from {2}' translated format: {instVarName. aClass name})
		autoSelect: instVarName
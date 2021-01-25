instance creation
addToolColors: theme
	"Tool-specific colors."
	
	"SUnit's TestRunner."
	theme 
		set: #failureColor for: #TestRunner to: self yellow;
		set: #errorColor for: #TestRunner to: self red;
		set: #passColor for: #TestRunner to: self green.
		
	"Monticello Tools."
	theme
		set: #revertedOperationAttributes for: #MCOperationsBrowser to: {TextEmphasis struckOut};
		set: #ignoredOperationAttributes for: #MCOperationsBrowser to: {TextColor color: self gray128}.
		
	"Browser."
	theme
		set: #noClassCommentColor for: #Browser to: self red;
		set: #deprecatedMessageAttributes for: #CodeHolder to: { TextEmphasis struckOut. TextColor color: self gray128 }.
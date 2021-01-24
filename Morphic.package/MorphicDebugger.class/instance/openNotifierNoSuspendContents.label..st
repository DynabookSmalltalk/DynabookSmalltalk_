initialize
openNotifierNoSuspendContents: msgString label: label

	| builder spec |
	super openNotifierNoSuspendContents: msgString label: label.
	
	builder := ToolBuilder default.
	spec := self buildNotifierWith: builder label: label message: msgString.

	^ ToolBuilder default open: spec
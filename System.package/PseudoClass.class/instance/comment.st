class
comment
	^self organization commentRemoteStr
		ifNil: [ self name,' has not been commented in this file']
		ifNotNil: [:rStr | rStr string]
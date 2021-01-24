configuring
morphicConfigure
	| address |
	address := UIManager default request: 'Email address:'.
	^ address isEmpty ifFalse: [self new emailAddress: address]
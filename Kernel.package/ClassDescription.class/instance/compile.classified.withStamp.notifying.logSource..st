compiling
compile: text classified: category withStamp: changeStamp notifying: requestor logSource: logSource 

	^self
		compile: text
		environment: (CurrentEnvironment signal ifNil: [ self environment ])
		classified: category
		withStamp: changeStamp
		notifying: requestor
		logSource: logSource
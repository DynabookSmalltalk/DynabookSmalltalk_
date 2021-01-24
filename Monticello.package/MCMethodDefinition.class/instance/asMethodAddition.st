converting
asMethodAddition
	^MethodAddition new
		compile: source
		classified: category
		withStamp: timeStamp
		notifying: nil
		logSource: true
		inClass: self actualClass.
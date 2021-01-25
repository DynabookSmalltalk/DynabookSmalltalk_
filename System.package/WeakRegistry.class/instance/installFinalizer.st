initialize-release
installFinalizer

	valueDictionary finalizer:
		[:executor|
		 (executors ifNil: [executors := OrderedCollection new]) add: executor]
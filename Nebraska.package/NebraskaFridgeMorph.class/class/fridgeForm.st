as yet unclassified
fridgeForm

	| fridgeFileName |

	fridgeFileName := 'fridge.form'.
	TheFridgeForm ifNotNil: [^TheFridgeForm].
	(FileDirectory default fileExists: fridgeFileName) ifFalse: [^nil].
	^TheFridgeForm := Form fromFileNamed: fridgeFileName.
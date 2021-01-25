fileIn/fileOut
fileOutCategory: categoryName

	| internalStream |
	internalStream := WriteStream on: (String new: 1000).
	self fileOutMethods: (self organization listAtCategoryNamed: categoryName)
			on: internalStream.
	FileStream writeSourceCodeFrom: internalStream baseName: (self name, '-', categoryName) isSt: true useHtml: false.

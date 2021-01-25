fileIn/fileOut
fileOutMethod: selector
	| internalStream |

	internalStream := WriteStream on: (String new: 1000).

	self fileOutMethods: (Array with: selector) on: internalStream.

	FileStream writeSourceCodeFrom: internalStream baseName: (self name , '-' , (selector copyReplaceAll: ':' with: '')) isSt: true useHtml: false.

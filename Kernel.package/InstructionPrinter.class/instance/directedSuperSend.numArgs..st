instruction decoding
directedSuperSend: selector "<Symbol>" numArgs: numArgs "<SmallInteger>"
	self print: 'directedSuperSend: ' , (self stringForSelector: selector numArgs: numArgs)
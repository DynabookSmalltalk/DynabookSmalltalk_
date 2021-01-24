private
activateReturn: aContext value: value
	"Activate 'aContext return: value' in place of self, so execution will return to aContext's sender"

	^Context 
		sender: self
		receiver: aContext
		method: Context theReturnMethod
		arguments: {value}
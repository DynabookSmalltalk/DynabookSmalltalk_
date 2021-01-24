converting
adaptToNumber: rcvr andSend: selector
	"If I am involved in arithmetic with a number, convert me to an integer."

	^ rcvr perform: selector with: self asInteger
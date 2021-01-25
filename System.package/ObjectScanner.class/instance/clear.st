initialize-release
clear
	"remove all old class vars.  They were UniClasses being remapped to aviod a name conflict."

	self class classPool keys do: [:key |
		self class classPool removeKey: key].	"brute force"
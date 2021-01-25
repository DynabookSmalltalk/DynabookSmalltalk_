instance creation
connectTo: serverHost port: serverPort

	| stringSock |

	stringSock := self socketConnectedTo: serverHost port: serverPort.
	^self new connection: stringSock

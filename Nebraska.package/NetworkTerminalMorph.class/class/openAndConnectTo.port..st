instance creation
openAndConnectTo: serverHost port: serverPort

	| stringSock me |

	stringSock := self socketConnectedTo: serverHost port: serverPort.
	me := self new connection: stringSock.
	^me openInStyle: #naked

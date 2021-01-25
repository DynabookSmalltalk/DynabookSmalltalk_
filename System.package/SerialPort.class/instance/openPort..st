open/close
openPort: portId 
	"Open the given serial port, using the settings specified by my
	instance variables."
	| p |
	self close.
	p := portId isString
		ifTrue: [self
				primOpenPortByName: portId
				baudRate: baudRate
				stopBitsType: stopBitsType
				parityType: parityType
				dataBits: dataBits
				inFlowControlType: inputFlowControlType
				outFlowControlType: outputFlowControlType
				xOnByte: xOnByte
				xOffByte: xOffByte]
		ifFalse: [self
				primOpenPort: portId
				baudRate: baudRate
				stopBitsType: stopBitsType
				parityType: parityType
				dataBits: dataBits
				inFlowControlType: inputFlowControlType
				outFlowControlType: outputFlowControlType
				xOnByte: xOnByte
				xOffByte: xOffByte].
	^p ifNotNil: [
		port := portId.
		self]
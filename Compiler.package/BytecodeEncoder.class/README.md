I am an abstract superclass for different bytecode set encoders.  Subclasses inherit the literal management of Encoder and encapsulate the mapping of opcodes to specific bytecodes.

Instance Variables
	blockExtentsToLocals:	<Dictionary from: Interval to: (Array of: String)>
	blockMethod:			<CompiledBlock>
	position:				<Integer>
	rootNode:				<MethodNode>
	stream:					<WriteStream | BytecodeEncoder>

blockExtentsToLocals
	- is a map from block extent to the sequence of temps defined in the block with that extent

blockMethod
	- the compiled block being generated in generateBlockMethodOfClass:trailer:from:

position
	- used to size bytecodes by having the receiver masquerade as a stream during sizeOpcodeSelector:withArguments:

rootNode
	- the MethodNode for the method being generated

stream
	- during bytecode sizing this is the receiver.  During bytecode generation this is the WriteStream on the method
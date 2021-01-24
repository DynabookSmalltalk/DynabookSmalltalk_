CompiledMethod instances are methods suitable for interpretation by the virtual machine.  They are a specialization of CompiledCode.  They represent methods, and may also, depending on the bytecode set, include nested blocks.  Bytecode sets that support non-nested blocks use CompiledBlock instances to implement nested block methods, that are separate from their enclosing method.  Bytecode sets that do not support non-nested blocks require the literals and bytecodes for a block to occur within the literals and bytecodes of a single CompiledMethod.  For example, the inject:into: method in the EncoderForV3PlusClosures bytecode set is as follows

Collection>>#inject:into:
	header	((primitive: 0) (numArgs: 2) (numTemps: 3) (numLiterals: 3) (frameSize: 16) (bytecodeSet: V3PlusClosures))
	literal1	#value:value:
	literal2	#inject:into:
	literal3	#Collection=>Collection
	33	<8A 01> push: (Array new: 1)
	35	<6A> popIntoTemp: 2
	36	<10> pushTemp: 0
	37	<8E 00 02> popIntoTemp: 0 inVectorAt: 2
	40	<70> self
	41	<11> pushTemp: 1
	42	<12> pushTemp: 2
	43	<8F 21 00 0A> closureNumCopied: 2 numArgs: 1 bytes 47 to 56
	47	        <11> pushTemp: 1
	48	        <8C 00 02> pushTemp: 0 inVectorAt: 2
	51	        <10> pushTemp: 0
	52	        <F0> send: value:value:
	53	        <8D 00 02> storeIntoTemp: 0 inVectorAt: 2
	56	        <7D> blockReturn
	57	<CB> send: do:
	58	<87> pop
	59	<8C 00 02> pushTemp: 0 inVectorAt: 2
	62	<7C> returnTop

whereas using the encoderForSistaV1 bytecode set it is

Collection>>#inject:into:
	header	((primitive: 0) (numArgs: 2) (numTemps: 3) (numLiterals: 3) (frameSize: 16) (bytecodeSet: #SistaV1))
	literal1	([] in Collection>>#inject:into: "a CompiledBlock(3755867)")
	literal2	#inject:into:
	literal3	#Collection=>Collection
	33	<E7 01> push: (Array new: 1)
	35	<D2> popIntoTemp: 2
	36	<40> pushTemp: 0
	37	<FD 00 02> popIntoTemp: 0 inVectorAt: 2
	40	<4C> self
	41	<41> pushTemp: 1
	42	<42> pushTemp: 2
	43	<F9 00 02> closureNumCopied: 2 numArgs: 1
	46	<7B> send: do:
	47	<D8> pop
	48	<FB 00 02> pushTemp: 0 inVectorAt: 2
	51	<5C> returnTop

[] in Collection>>#inject:into: "a CompiledBlock(3755867)"
	header	((block #full) (numArgs: 1) (numTemps: 3) (numLiterals: 3) (frameSize: 16) (bytecodeSet: #SistaV1))
	literal1	#value:value:
	literal2	nil
	literal3	(Collection>>#inject:into: "a CompiledMethod(736427)")
	33	<41> pushTemp: 1
	34	<FB 00 02> pushTemp: 0 inVectorAt: 2
	37	<40> pushTemp: 0
	38	<A0> send: value:value:
	39	<FC 00 02> storeIntoTemp: 0 inVectorAt: 2
	42	<5E> blockReturn

The last literal in a CompiledMethod must be its methodClassAssociation, a binding whose value is the class the method is installed in.  The methodClassAssociation is used to implement super sends.  If a method contains no super send then its methodClassAssociation may be nil (as would be the case for example of methods providing a pool of inst var accessors).  

By convention the penultimate literal of a method is either its selector or an instance of AdditionalMethodState.  AdditionalMethodState holds the method's selector and any pragmas and properties of the method.  AdditionalMethodState may also be used to add instance variables to a method, albeit ones held in the method's AdditionalMethodState.  Subclasses of CompiledMethod that want to add state should subclass AdditionalMethodState to add the state they want, and implement methodPropertiesClass on the class side of the CompiledMethod subclass to answer the specialized subclass of AdditionalMethodState.  Enterprising programmers are encouraged to try and implement this support automatically through suitable modifications to the compiler and class builder.
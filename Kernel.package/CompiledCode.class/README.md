CompiledCode instances are methods suitable for execution by the virtual machine.  Instances of CompiledCode and its subclasses are the only objects in the system that have both indexable pointer fields and indexable 8-bit integer fields.  The pointer fields are used for literals and metadata, and the bytes are used for bytecodes and a variety of encoded informaton such as source code, source code position, etc.  The first part of a CompiledCode object is pointers, the second part is bytes.  CompiledCode inherits from ByteArray to avoid duplicating some of ByteArray's methods, not because a CompiledCode is-a ByteArray.

Instance variables: *indexed* (no named inst vars)

Class variables:
SmallFrame								- the number of stack slots in a small frame Context
LargeFrame							- the number of stack slots in a large frame Context
PrimaryBytecodeSetEncoderClass		- the encoder class that defines the primary instruction set
SecondaryBytecodeSetEncoderClass	- the encoder class that defines the secondary instruction set

The current format of a CompiledCode object is as follows:

	header (4 or 8 bytes, SmallInteger)
	literals (4 or 8 bytes each, Object, see "The last literal..." below)
	bytecodes  (variable, bytes)
	trailer (variable, bytes)

The header is a SmallInteger (which in the 32-bit system has 31 bits, and in the 64-bit system, 61 bits) in the following format:

	(index 0)		15 bits:	number of literals (#numLiterals)
	(index 15)		  1 bit:	jit without counters - reserved for methods that have been optimized by Sista
	(index 16)		  1 bit:	has primitive
	(index 17)		  1 bit:	whether a large frame size is needed (#frameSize => either SmallFrame or LargeFrame)
	(index 18)		  6 bits:	number of temporary variables (#numTemps)
	(index 24)		  4 bits:	number of arguments to the method (#numArgs)
	(index 28)		  2 bits:	reserved for an access modifier (00-unused, 01-private, 10-protected, 11-public), although accessors for bit 29 exist (see #flag).
	sign bit:		  1 bit: selects the instruction set, >= 0 Primary, < 0 Secondary (#signFlag)

If the method has a primitive then the first bytecode of the method must be a callPrimitive: bytecode that encodes the primitive index.  This bytecode can encode a primitive index from 0 to 65535.

The trailer is an encoding of an instance of CompiledMethodTrailer.  It is typically used to encode the index into the source files array of the method's source, but may be used to encode other values, e.g. tempNames, source as a string, etc.  See the class CompiledMethodTrailer.

While there are disadvantages to this "flat" representation (it is impossible to add named instance variables to CompiledCode or its subclasses, but it is possible indirectly; see AdditionalMethodState) it is effective for interpreters.  It means that both bytecodes and literals can be fetched directly from a single method object, and that only one object, the method, must be saved and restored on activation and return.  A more natural representation, in which there are searate instance variables for the bytecode, and (conveniently) the literals, requires either much more work on activation and return setting up references to the literals and bytecodes, or slower access to bytecodes and literals, indirecting on each access.

The last literal of a CompiledCode object is reserved for special use by the kernel and/or the virtual machine.  In CompiledMethod instances it must either be the methodClassAssociation, used to implement super sends, or nil, if the method is anonymous. In CompiledBlock it is to be used for a reference to the enclosing method or block object.

By convention, the penultimate literal is reserved for special use by the kernel. In CompiledMethod instances it must either be the method selector, or an instance of AdditionalMethodState which holds the selector and any pragmas or properties in the method.  In CompiledBlock it is reserved for use for an AdditionalMethodState.

Note that super sends in CompiledBlock instances do not use a methodClass association, but expect a directed supersend bytecode, in which the method class (the subclass of the class in which to start the lookup) is a literal.  Logically when we switch to a bytecode set that supports the directed super send bytecode, and discard the old super send bytecodes, we can use the last literal to store the selector or the enclosing method/block or an AdditionalMethodState, and the AdditionalMethodState can hold the selector and/or the enclosing method/block.
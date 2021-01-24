private
tooDangerousClasses
	"Return a list of class names which will not be modified in the public interface"
	^#(
		"Object will break immediately"
		ProtoObject Object
		"Contexts and their superclasses"
		InstructionStream Context BlockClosure
		"Superclasses of basic collections"
		Collection SequenceableCollection ArrayedCollection
		"Collections known to the VM"
		Array Bitmap String Symbol ByteArray CompiledCode CompiledMethod CompiledBlock
		"Basic Numbers & Magnitudes"
		Magnitude Number SmallInteger Float BoxedFloat64 SmallFloat64 Character
		"Misc other"
		LookupKey Association Link Point Rectangle Behavior PositionableStream UndefinedObject
	)

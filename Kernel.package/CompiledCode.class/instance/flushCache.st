cleaning
flushCache
	"Tell the virtual machine to remove all references to this method from its method
	 lookup cache(s), if it has them. This is provided for backwards compatibility.
	 When a method is redefined (added to, removed from, or replaced in, a method
	 dictionary) then Symbol flushCache should be used. This is because adding or
	 removing a method may alter the method that a given selector should invoke
	 for methods other than the receiver.  For example, if a subclass inherits a
	 method and this is overridden, flushing the new method will not flush the existing
	 method.

	 If a method is modified in-place (for example, some bytecode is replaced by
	 bytecode that effects a breakpoint) then voidCogVMState should be used."

	<primitive: 116>
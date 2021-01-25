I am a registry for objects needing finalization. When an object is added the object as well as its executor is stored. When the object is garbage collected, the executor can take the appropriate action for any resources associated with the object.

This kind of WeakRegistry is using a new VM feature, which allows a more robust finalization support. In contrast to the old implementation, it doesn't spend linear time checking which elements became garbage.

See also:
	Object executor
	Object actAsExecutor
	Object finalize
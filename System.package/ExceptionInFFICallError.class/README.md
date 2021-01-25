An ExceptionInFFICallError is used to answer the exception code and program counter at which an exceprion occurred during an FFI call.  Note that such exceptions are only delivered under certain circumstances, by default if an FFI callout method includes an error code variable.  But the VM provides command-line arguments to override this behaviour, either to always deliver or never deliver such exceptions as primitive failures.  And support appeared in VMs from VMMaker.oscog-eem.2433 or later.

Instance Variables
	pc:		<Integer>

errorCode (inherited)
	- the error code for the exception, which is platform-dependent.  e.g. on Win32 it is the ExceptionRecord->ExceptionCode, such as 16rC0000005, and on Unix it is SIGBUS, SIGILL, SIGSEGV et al.

pc
	- the program counter of the instruction that raised an exception

Here is a small FFI example to provoke such an error.  Warning: this will crash the VM if either the VM is too old, or if ExternalFunction>>#invokeWithArguments: is lacking an error code, or if the handling has been overridden by the relevant VM command line argument.

| pt handleClass elf |
pt := Parser new parse: 'function <cdecl: void ''foo'' () error: ec> self ffiCallFailedWith: ec' class: UndefinedObject.
elf := pt encoder literals first.
handleClass := elf getHandle class.
ByteArray adoptInstance: elf getHandle. "otherwise ExternalHandle access fails cuz address not in heap"
Smalltalk wordSize = 8
	ifTrue: [elf getHandle unsignedLongLongAt: 1 put: 17]
	ifFalse: [elf getHandle unsignedLongAt: 1 put: 17].
handleClass adoptInstance: elf getHandle.
elf invoke

I represent an independent path of control in the system. This path of control may be stopped (by sending the message suspend) in such a way that it can later be restarted (by sending the message resume). When any one of several paths of control can be advanced, the single instance of ProcessorScheduler named Processor determines which one will actually be advanced, partly using the value of priority.

Instance Variables: N.B. The first four are used by the virtual machine. They must be defined, and defined in this order,
	suspendedContext:		<Context|nil>
	priority:					<Integer>
	myList:					<LinkedList|nil>
	threadId:				<Integer|nil>
	effectiveProcess:		<Process|nil>
	name:					<String|nil>
	island:					<Island|nil>
	env:					<Dictionary|nil>

effectiveProcess
	- if not nil effectiveProcess is the process the receiver is running on behalf of.  Used by the execution smulation machinery (used by the debugger) to ensure that Processor activeProcess et al answer the expected result when simulating execution (e.g. when debugging).  See evaluate:onBehalfOf: and senders.

env
	- if not nil this is a Dictionary providing process-specific variables.  See e.g. environmentAt:*, DynamicVariable and ProcessSpecificVariable.

island
	- used by Tweak and Croquet to partition the image into multiple address spaces

myList
	- if nil, the receiver is either suspended or the active process.  If not nil it is either some condition variable (Semaphore, Mutex) that the receiver is blocked waiting on, or it is the LinkedList in ProcessorScheduler quiescentProcesses that holds the processes for the receiver's priority that are not the current active process but are still runnable.

name
	- if not nil this is the name of the process, used for information, see e.g. the names of processes displayed in the ProcessBrowser

priority
	- the priority of the process, which corresponds to the index in ProcessorScheduler quiescentProcesses that holds the LinkedList of processes at this priority.  If running but quiescent, changing priority involves changing priority and myList.

suspendedContext
	- if nil, then the receiver is either the active process or has been terminated.  If not nil it is the Context at the hot end of the receiver's stack

threadId
	- if not nil then the receiver is bound to some native thread and the VM will ensure that when executing the receiver, the VM will be running on that native thread.  Set by the VM.  Not to be set manually.  Meaningful only on threaded VMs (which do not mean VMs with a threaded heartbeat).  It is required to be the fourth instance variable. See SmalltalkImage >> #processHasThreadIdInstVar: for further information.
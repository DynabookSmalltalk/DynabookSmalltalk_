changing process state
terminate 
	"Stop the process that the receiver represents forever.
	 Unwind to execute pending ensure:/ifCurtailed: blocks before terminating.
	 If the process is in the middle of a critical: critical section, release it properly."

	| ctxt unwindBlock oldList |
	self isActiveProcess ifTrue:
		[ctxt := thisContext.
		 [ctxt := ctxt findNextUnwindContextUpTo: nil.
		  ctxt ~~ nil] whileTrue:
			[(ctxt tempAt: 2) ifNil:
				["N.B. Unlike Context>>unwindTo: we do not set complete (tempAt: 2) to true."
				 unwindBlock := ctxt tempAt: 1.
				 thisContext terminateTo: ctxt.
				 unwindBlock value]].
		thisContext terminateTo: nil.
		self suspend.
		"If the process is resumed this will provoke a cannotReturn: error.
		 Would self debug: thisContext title: 'Resuming a terminated process' be better?"
		^self].

	"Always suspend the process first so it doesn't accidentally get woken up.
	 N.B. If oldList is a LinkedList then the process is runnable. If it is a Semaphore/Mutex et al
	 then the process is blocked, and if it is nil then the process is already suspended."
	oldList := self suspend.
	suspendedContext ifNotNil:
		["Release any method marked with the <criticalSection> pragma.
		  The argument is whether the process is runnable."
		 self releaseCriticalSection: (oldList isNil or: [oldList class == LinkedList]).

		"If terminating a process halfways through an unwind, try to complete that unwind block first."
		(suspendedContext findNextUnwindContextUpTo: nil) ifNotNil:
			[:outer|
			 (suspendedContext findContextSuchThat:[:c| c closure == (outer tempAt: 1)]) ifNotNil:
				[:inner| "This is an unwind block currently under evaluation"
				 suspendedContext runUntilErrorOrReturnFrom: inner]].

		ctxt := self popTo: suspendedContext bottomContext.
		ctxt == suspendedContext bottomContext ifFalse:
			[self debug: ctxt title: 'Unwind error during termination'].
		"Set the context to its endPC for the benefit of isTerminated."
		ctxt pc: ctxt endPC]
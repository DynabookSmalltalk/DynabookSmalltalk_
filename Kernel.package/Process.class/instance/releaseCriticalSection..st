private
releaseCriticalSection: runnable
	"Figure out if we are terminating a process that is in the ensure: block of a critical section.
	 In this case, if the block has made progress, pop the suspendedContext so that we leave the
	 ensure: block inside the critical: without signaling the semaphore/exiting the primitive section,
	 since presumably this has already happened.  But if it hasn't made progress but is beyond the
	 wait (which we can tell by the oldList being one of the runnable lists, i.e. a LinkedList, not a
	 Semaphore or Mutex, et al), then the ensure: block needs to be run."
	| selectorJustSent |
	(suspendedContext method pragmaAt: #criticalSection) ifNil: [^self].
	selectorJustSent := suspendedContext selectorJustSentOrSelf.

	"Receiver and/or argument blocks of ensure: in Semaphore>>critical: or Mutex>>#critical:"
	suspendedContext isClosureContext ifTrue:
		[suspendedContext sender isUnwindContext ifTrue:
			[| notWaitingButMadeNoProgress |
			"Avoid running the ensure: block twice, popping it if it has already been run. If runnable
			 but at the wait, leave it in place. N.B. No need to check if the block receiver of ensure: has
			 not started to run (via suspendedContext pc = suspendedContext startpc) because ensure:
			 uses valueNoContextSwitch, and so there is no suspension point before the wait."
			 notWaitingButMadeNoProgress :=
				runnable
				and: [selectorJustSent == #wait
				and: [suspendedContext sender selectorJustSentOrSelf == #valueNoContextSwitch]].
			 notWaitingButMadeNoProgress ifFalse:
				[suspendedContext := suspendedContext home]].
		 ^self].

	"Either Semaphore>>critical: or Mutex>>#critical:.  Is the process still blocked?  If so, nothing further to do."
	runnable ifFalse: [^self].

	"If still at the wait the ensure: block has not been activated, so signal to restore."
	selectorJustSent == #wait ifTrue:
		[suspendedContext receiver signal].

	"If still at the lock primitive and the lock primitive just acquired ownership (indicated by it answering false)
	 then the ensure block has not been activated, so explicitly primitiveExitCriticalSection to unlock."
	(selectorJustSent == #primitiveEnterCriticalSection
	 or: [selectorJustSent == #primitiveTestAndSetOwnershipOfCriticalSection]) ifTrue:
		[(suspendedContext stackPtr > 0
		  and: [suspendedContext top == false]) ifTrue:
			[suspendedContext receiver primitiveExitCriticalSection]]
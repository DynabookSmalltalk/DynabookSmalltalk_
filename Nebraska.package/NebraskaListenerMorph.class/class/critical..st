as yet unclassified
critical: aBlock

	QueueSemaphore ifNil: [QueueSemaphore := Semaphore forMutualExclusion].
	^QueueSemaphore critical: aBlock

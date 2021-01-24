object fileIn
convertAlarms
	"We now store the alarms in a MorphicAlarmQueue, rather than a Heap.
	 Make sure we have a fresh one.  If it is already a MorphicAlarmQueue
	 updating it will ensure any block to method references are fresh."
	alarms ifNotNil:
		[:oldAlarms|
		 alarms class == MorphicAlarmQueue
			ifTrue:
				[alarms := MorphicAlarmQueue new.
				 oldAlarms alarmsDoSafely: [:alarm | alarms add: alarm]]
			ifFalse:
				[alarms := MorphicAlarmQueue new.
				 oldAlarms do: [:alarm | alarms add: alarm]]]
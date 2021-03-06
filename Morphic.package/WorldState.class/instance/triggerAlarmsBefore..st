alarms
triggerAlarmsBefore: nowTime
	"Trigger all pending alarms that are to be executed before nowTime."
	| triggered |
	lastAlarmTime ifNil:[lastAlarmTime := nowTime].
	(nowTime < lastAlarmTime or:[nowTime - lastAlarmTime > 10000])
		ifTrue:[self adjustAlarmTimes: nowTime].
	triggered := self lockAlarmsDuring: [:pending |
		pending removeAllAlarmsBefore: nowTime ].
	triggered do: [:alarm | alarm value: nowTime].
	lastAlarmTime := nowTime.
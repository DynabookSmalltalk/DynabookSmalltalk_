balloon help
removePendingBalloonFor: aMorph
	"Get rid of pending balloon help or remove the balloon help if already shown."
	
	self flag: #workaround. "mt: We do not track for which morph there is a pending balloon. To avoid cancelling the wrong requests, check whether the given morph wants a balloon or not. Seems to work fine."
	aMorph wantsBalloon ifFalse: [^ self].
	
	self removeAlarm: #spawnBalloonFor:.
	self deleteBalloonTarget: aMorph.
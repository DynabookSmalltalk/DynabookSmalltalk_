initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	transmitWhileRecording := false.
	handsFreeTalking := false.
	mycodec := GSMCodec new.
	myrecorder := ChatNotes new.
	mytargetip := ''.
	
	self start2.
	self changeTalkButtonLabel
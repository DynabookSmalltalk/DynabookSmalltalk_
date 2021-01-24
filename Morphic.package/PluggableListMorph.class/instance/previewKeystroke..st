model access - keystroke
previewKeystroke: keystrokeEvent
	"Let the model decide if it's going to handle the event for us"

	keystrokePreviewSelector ifNil: [^ false].
	
	^ model
		perform: keystrokePreviewSelector
		withEnoughArguments: {
			keystrokeEvent.
			self}
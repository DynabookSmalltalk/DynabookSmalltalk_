system attributes
sendMouseWheelEvents
	"The Cog VM can be instructed to deliver mouse wheel events as mouse wheel events.
	 By default mouse wheel events are mapped to arrow events.
	 This flag persists across snapshots, stored in the image header."

	^(self vmParameterAt: 48) anyMask: 32
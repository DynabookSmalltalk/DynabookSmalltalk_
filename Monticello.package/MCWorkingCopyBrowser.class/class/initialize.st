class initialization
initialize
	 (TheWorldMenu respondsTo: #registerOpenCommand:)
         ifTrue: [TheWorldMenu registerOpenCommand: {'Monticello Browser'. {self. #open}}]
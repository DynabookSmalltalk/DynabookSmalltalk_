accessing
contents: newContents 

	self flag: #todo. "mt: hasFocus == true means that the mini editor was launched. We should now ignore any external calls to this method to avoid visual glitches. However, #interimContents: does also use this callback. Figure something out."

	newContents isText
		ifTrue: [^ self initializeFromText: newContents].

	contents = newContents
		ifTrue: [^ self "No substantive change."].

	contents := newContents.
	self changed. "New contents need to be drawn."
		
	self fitContents. "Resize if necessary."
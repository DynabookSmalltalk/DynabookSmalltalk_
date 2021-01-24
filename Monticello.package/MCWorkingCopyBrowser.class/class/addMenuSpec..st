hooks
addMenuSpec: aMCMenuSpec
	"Register a context menu entry in the monticello browser from an external package.
	 The MCWorkingCopyBrowser model is passed as argument."
	self externalMenuEntries 
		remove: aMCMenuSpec 
		ifAbsent: ["Remove any previous entry with description string"];
		add: aMCMenuSpec.
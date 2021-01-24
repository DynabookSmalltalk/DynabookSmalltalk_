actions
refresh
	packageNames := versionNames := newer := nil.
	repository refresh.
	self
		 changed: #packageList ;
		 changed: #versionList.
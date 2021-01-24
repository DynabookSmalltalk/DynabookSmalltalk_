initialize-release
postAcceptBrowseFor: aModel
	"Make the same selections as in aModel."
	self 
		packageSelection: aModel packageSelection ;
		versionSelection: aModel versionSelection
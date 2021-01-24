utilities
findAFolderForProject: aProject label: dialogLabel
	"Find a folder for saving or loading a project"

	^DirectoryChooserDialog findAFolderForProject: aProject label: dialogLabel

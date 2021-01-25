read/write segment
revert
	"Pretend this segment was never brought in.  Check that it has a fileName.  Replace (using become:) all the original roots of a segment with segmentRootStubs.  Thus the original objects will be reclaimed, and the root stubs will remain to bring the segment back in if it is needed.
	How to use revert:  In the project, choose 'save for reverting'.

	ReEnter the project.  Make changes.
	Either exit normally, and change will be kept, or
		Choose 'Revert to saved version'."

	fileName ifNil: [^ self].
	(state = #inactive) | (state = #onFile) ifFalse: [^ self].
	Cursor write showWhile: [
		arrayOfRoots elementsForwardIdentityTo:
			(arrayOfRoots collect: [:r | r rootStubInImageSegment: self]).
		state := #onFile.
		segment := nil]

"Old version:
	How to use revert:  In the project, execute 
(Project current projectParameters at: #frozen put: true)
	Leave the project.  Check that the project went out to disk (it is gray in the Jump to Project list).
	ReEnter the project.  Hear a plink as it comes in from disk.  Make a change.
	Exit the project.  Choose 'Revert to previous version' in the dialog box.
	Check that the project went out to disk (it is gray in the Jump to Project list).
	ReEnter the project and see that it is in the original state."
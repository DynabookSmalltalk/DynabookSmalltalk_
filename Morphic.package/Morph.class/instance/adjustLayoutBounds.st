layout
adjustLayoutBounds
	"Adjust the receivers bounds depending on the resizing strategy imposed"
	
	| hFit vFit box sbox myExtent myOrigin myBox |
	hFit := self hResizing.
	vFit := self vResizing.
	(hFit == #shrinkWrap or:[vFit == #shrinkWrap]) ifFalse:[^self]. "not needed"
	
	(self cellSpacing == #none and: [self listSpacing == #none]) ifFalse: [
		self flag: #todo. "mt: Find a way to make cell sizes accessible from here."
		self notify: 'It is not possible to shrink-wrap around submorphs when the layout policy reserves extra cell space. At this point, we have no access to that extra cell space and we do not know whether the submorph did make use of that extra space. So, shrink-wrapping could make the bounds very unstable.\\Please either reset #cellSpacing and #listSpacing - or change the resizing strategy to #rigid or #spaceFill.' withCRs.
		^ self]. 
	
	box := self layoutBounds.
	sbox := self submorphBoundsForShrinkWrap outsetBy: self cellInset.
	
	myExtent := box extent.
	myOrigin := box origin.
	hFit == #shrinkWrap ifTrue:[
		myExtent := sbox extent x @ myExtent y.
		myOrigin := sbox origin x @ myOrigin y].
	vFit == #shrinkWrap ifTrue:[
		myExtent := myExtent x @ sbox extent y.
		myOrigin := myOrigin x @ sbox origin y].
	"Make sure we don't get smaller than minWidth/minHeight"
	myExtent x < self minWidth ifTrue:[
		myExtent := (myExtent x max: 
			(self minWidth - self bounds width + self layoutBounds width)) @ myExtent y].
	myExtent y < self minHeight ifTrue:[
		myExtent := myExtent x @ (myExtent y max:
			(self minHeight - self bounds height + self layoutBounds height))].
		
	myBox := myOrigin extent: myExtent.
	self setLayoutBoundsFromLayout: myBox.
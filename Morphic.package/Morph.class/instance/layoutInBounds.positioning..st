layout
layoutInBounds: cellBounds positioning: cellPositioning
	"Layout specific. Apply the given bounds to the receiver after being layed out in its owner."
	
	| box |	
	"1) We are getting new bounds here but we haven't computed the receiver's layout yet."
	self layoutComputed ifFalse:[
		"Although the receiver has reported its #minExtent before the actual size it has may differ from what would be after the layout. Normally, this isn't a real problem, but if we have #shrinkWrap constraints (see #adjustLayoutBounds) then the receiver's bounds may be larger than the cellBounds. THAT is a problem because the centering may not work correctly if the receiver shrinks after the owner layout has been computed. To avoid this problem, we compute the receiver's layout now. Note that the layout computation is based on the new cell bounds rather than the receiver's current bounds."
		
		"1.1) Adjust the box for #rigid receiver. Both #spaceFill and #shrinkWrap can use the cellBounds for now, which is important for many space-fills in a row or column to have the same widths (or heights) such as all MenuMorphItems in our MenuMorph."
		box := cellBounds origin extent: 
			(self hResizing == #rigid ifTrue: [self bounds extent x] ifFalse: [cellBounds extent x]) @
			(self vResizing == #rigid ifTrue: [self bounds extent y] ifFalse: [cellBounds extent y]).
		
		"1.2) Move and resize the receiver to get started."
		self
			setPositionFromLayout: box origin;
			setExtentFromLayout: box extent.
		
		"1.3) Adjust to layout bounds and do the layout."
		box := box origin - (self bounds origin - self layoutBounds origin) corner:
					box corner - (self bounds corner - self layoutBounds corner).
		self doLayoutIn: box].
	
"	self assert: self layoutComputed.
	self assert: self owner layoutComputed not.
"
	"2) Are we done already?"
	cellBounds extent = self bounds extent
		"Nice fit. I usually am done here if #minExtent did already trigger layout update (via #fullBounds) while my owner's layout was calculating the cell sizes."
		ifTrue:[^ self setPositionFromLayout: cellBounds origin].
		
	"3) We have the receiver's layout. Maybe we just computed it or we did not invalidate it in this run. The latter happens if our owner invalidates without telling us. The user dragging size grips in windows, for example. Now we have to consider #spaceFill constraints, which may trigger re-computation of the receiver's layout."
	box := self bounds.
	self hResizing == #spaceFill 
		ifTrue: [
			"Support dynamic width-for-height due to space-fill constraint -- another layout run needed?"
			(box width ~= cellBounds width and: [self vResizing == #shrinkWrap])
				ifTrue: [self owner ifNotNil: [:o | o setProperty: #doLayoutAgain toValue: true]].
			"Fill the cell."
			box := box origin extent: cellBounds width @ box height].
		
	self vResizing == #spaceFill
		ifTrue: [
			"Support dynamic height-for-width due to space-fill constraint -- another layout run needed?"
			(box height ~= cellBounds height and: [self hResizing == #shrinkWrap])
				ifTrue: [self owner ifNotNil: [:o | o setProperty: #doLayoutAgain toValue: true]].
			"Fill the cell."	
			box := box origin extent: box width @ cellBounds height].

	"4) We have the receiver's layout. Align in the cell according o the owners layout properties."
	box := box align: (box perform: cellPositioning) with: (cellBounds perform: cellPositioning).

"	self assert: self layoutComputed.
	self assert: self owner layoutComputed not.
"
	"5) Install the new bounds. This may invalidate my layout again, which is okay because my owner will ask about my fullBounds in #doLayoutIn: (and #privateFullBounds). My layout will be re-computed then."		
	self bounds: box.
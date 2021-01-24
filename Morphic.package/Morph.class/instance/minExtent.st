layout
minExtent
	"Layout specific. Return the minimum size the receiver can be represented in.
	Implementation note: When this message is sent from an owner trying to lay out its children it will traverse down the morph tree and recompute the minimal arrangement of the morphs based on which the minimal extent is returned. When a morph with some layout strategy is encountered, the morph will ask its strategy to compute the new arrangement. However, since the final size given to the receiver is unknown at the point of the query, the assumption is made that the current bounds of the receiver are the base on which the layout should be computed. This scheme prevents strange layout changes when for instance, a table is contained in another table. Unless the inner table has been resized manually (which means its bounds are already enlarged) the arrangement of the inner table will not change here. Thus the entire layout computation is basically an iterative process which may have different results depending on the incremental changes applied."

	| layout minExtent extra hFit vFit |
	hFit := self hResizing.
	vFit := self vResizing.
	
	(self owner isNil or: [self owner layoutPolicy isNil])
		ifTrue: [
			hFit == #spaceFill ifTrue: [hFit := #rigid].
			vFit == #spaceFill ifTrue: [vFit := #rigid]].

	"0) The receiver will not adjust to parents layout by growing or shrinking, which means that an accurate layout defines the minimum size. So, compute the layout and return its bounds as minimal extent. DO NOT return fullBounds because the morph itself is being layed out."
	(hFit == #spaceFill or: [vFit == #spaceFill]) 
		ifFalse: [self fullBounds. ^ self bounds extent].

	"1) Ask the layout policy to compute the minimum extent."
	layout := self layoutPolicy.
	layout isNil 
		ifTrue: [minExtent := 0@0]
		ifFalse: [minExtent := layout minExtentOf: self in: self layoutBounds].

	"2) #rigid fitting has to stay as is." 
	hFit == #rigid 
		ifTrue: [minExtent := self width @ minExtent y].
	vFit == #rigid 
		ifTrue: [minExtent := minExtent x @ self height].

	"3) #spaceFill fitting has to account for layout inset."
	hFit == #spaceFill
		ifTrue: [
			(vFit == #shrinkWrap and: [self wrapDirection ~= #none])
				ifTrue: [minExtent := 1 @ minExtent y "Give h-space a chance to v-wrap and v-shrink."]
				ifFalse: [
					extra := self bounds width - self layoutBounds width.
					minExtent := (minExtent x + extra) @ minExtent y]].
	vFit == #spaceFill
		ifTrue: [
			(hFit == #shrinkWrap and: [self wrapDirection ~= #none])
				ifTrue: [minExtent := minExtent x @ 1 "Give v-space a chance to h-wrap and h-shrink."]
				ifFalse: [
					extra := self bounds height - self layoutBounds height.
					minExtent := minExtent x @ (minExtent y + extra)]].

	"4) #shrinkWrap fitting has to support height-for-width (or width-for-height)."
	hFit == #shrinkWrap
		ifTrue: [
			self fullBounds. "Compute layout now to get shrink-wrapped width."
			minExtent := self width @ minExtent y].
	vFit == #shrinkWrap
		ifTrue: [
			self fullBounds. "Compute layout now to get shrink-wrapped height."
			minExtent := minExtent x @ self height].

	"5) For morphs without submorphs (or without a layout policy), be sure to overwrite #doLayoutIn: and use #minWidth and #minHeight to implement #shrinkWrap such as in MenuItemMorph."
	^ minExtent max: self minWidth @ self minHeight
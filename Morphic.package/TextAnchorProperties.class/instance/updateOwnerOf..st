private
updateOwnerOf: aMorph

	aMorph owner isTextMorph ifTrue: [
		aMorph owner 
			anchorMorph: aMorph
			at: aMorph position
			type: self anchorLayout]	
open/close
openInWorld: aWorld extent: extent
	"This msg and its callees result in the window being activeOnlyOnTop"
	^ (self anyOpenWindowLikeMeIn: aWorld)
		ifEmpty:
			[ self 
				position: (RealEstateAgent initialFrameFor: self initialExtent: extent world: aWorld) topLeft ;
				extent: extent.
			self openAsIsIn: aWorld ]
		ifNotEmptyDo:
			[ : windows | 
			windows anyOne
				expand ;
				beKeyWindow ; 
				postAcceptBrowseFor: self ].
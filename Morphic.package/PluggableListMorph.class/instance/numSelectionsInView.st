scrolling
numSelectionsInView
	"Overwritten to map submorphCount to the (filtered) list size. There is only one submorph: the lazy list morph."
	
	^ scroller numberOfItemsPotentiallyInViewWith: self listSize
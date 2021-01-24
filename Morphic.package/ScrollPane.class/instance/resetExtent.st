geometry
resetExtent
	"Reset the extent. (may be overridden by subclasses which need to do more than this)"
	
	self flag: #deprecate. "mt: Remove all uses in Etoys."
	self resizeScroller
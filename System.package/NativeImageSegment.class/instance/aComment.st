compact classes
aComment
	"Spur does not use compact classes, so an effort has been made to excise their use from the code.  The previous comment was:

	Compact classes are a potential problem because a pointer to the class would not ordinarily show up in the outPointers.  We add the classes of all compact classes to outPointers, both for local and export segments.
	Compact classes are never allowed as roots.  No compact class may be in an Environment that is written out to disk.  (In local segments, the compact classes array should never have an ImageSegmentRootStub in it.  For export, fileIn the class first, then load a segment with instances of it.  The fileIn code can be pasted onto the front of the .extSeg file) 
	For local segments, a class may become compact while its instances are out on the disk.  Or it may become un-compact.  A compact class may change shape while some of its instances are on disk.  All three cases go through (ClassDescription updateInstancesFrom:).  If it can't rule out an instance being in the segment, it reads it in to fix the instances.  
	See Behavior.becomeCompact for the rules on Compact classes.  Indexes may not be reused.  This is so that an incoming export segment has its index available.  (Changes may be needed in the way indexes are assigned.)
	For export segments, a compact class may have a different shape.  The normal class reshape mechanism will catch this.  During the installation of the segment, objects will have the wrong version of their class momentarily.  We will change them back before we get caught.
	For export segments, the last two items in outPointers are the number 1717 and an array of the compact classes used in this segment.  (The classes in the array are converted from DiskProxies by SmartRefStream.)  If that class is not compact in the new image, the instances are recopied."
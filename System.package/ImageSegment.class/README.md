I represent a segment of Squeak address space.  I am created from an
array of root objects.  After storing, my segment contains a binary
encoding of every object accessible from my roots but not otherwise
accessible from anywhere else in the system.  My segment contains
outward pointers that are indices into my table of outPointers.
On load my segment is converted back into objects and becommed
into an Array of the loaded objects, so they can be enumerated.

I have two concrete subclasses, NativeImageSegment and
LegacyImageSegment.  NativeImageSegment uses a pair of primitives,
one to create a segment and one to load it. LegacyImageSegment
implements the load primitive for the older Squeak memory format
(sometimes called "v3") but uses pure Smalltalk code.

	The main use of ImageSegments is to store Projects.  A dummy
version of SmartRefStream traverses the Project.  Everything it finds
is classified as either an object that is owned by the project (only
pointed to inside the project), or an object outside the project that
is pointed to from inside the project.  The objects that are
completely owned by the project are compressed into pure binary form
in an ImageSegment.  The outside objects are put in the 'outPointers'
array.  The entire ImageSegment (binary part plus outPointers) is
encoded in a SmartRefStream, and saved on the disk.  (aProject
exportSegmentWithChangeSet:fileName:directory:) calls (anImageSegment
writeForExportWithSources:inDirectory:changeSet:).
	Note that every object inside the project is put into the
segment's arrayOfRoots.  This is because a dummy SmartRefStream to
scan the project, in order to make intelligent decisions about what
belongs in the project.
	See Project's class comment for what messages are sent to
objects as they are unpacked in a new image.

---- Older Details ------

	The primary kind of image segment is an Export Segment.  It
can be saved on a server and read into a completely different Squeak
image.
Old way to create one:
(ImageSegment new copyFromRootsForExport: (Array with: Baz with: Baz class))
		writeForExport: 'myFile.extSeg'.
Old way to create one for a project:
	(Project named: 'Play With Me - 3') exportSegment.
To read it into another image:  Select 'myFile.extSeg' in a FileList,
Menu 'load as project'.  It will install its classes automatically.
If you need to see the roots array, it is temporarily stored in
(SmartRefStream scannedObject).

Most of 'states' of an ImageSegment are not used to export a project,
and have been abandoned.

	When a segment is written out onto a file, it goes in a
folder called <image name>_segs.  If your image is called
"Squeak2.6.image", the folder "Squeak2.6_segs" must accompany the
image whenever your move, copy, or rename it.
	Whenever a Class is in arrayOfRoots, its class (aClass class)
must also be in the arrayOfRoots.
	There are two kinds of image segments.  Normal image segments
are a piece of a specific Squeak image, and can only be read back
into that image.  The image holds the array of outPointers that are
necessary to turn the bits in the file into objects.
	To put out a normal segment that holds a Project (not the
current project), execute (Project named: 'xxx') storeSegment.


arrayOfRoots	The objects that head the tree we will trace.
segment			The WordArray of raw bits of all objects in the tree.
outPointers		Oops of all objects outside the segment
pointed to from inside.
state			(see below)
segmentName	Its basic name.  Often the name of a Project.
fileName		The local name of the file.  'Foo-23.seg'
userRootCnt		number of roots submitted by caller.  Extras
are added in preparation for saving.

state that an ImageSegment may exist in...

#activeCopy			(has been copied, with the intent to
become active)
arrayOfRoots, segment, and outPointers have been created by
copyFromRoots:.  The tree of objects has been encoded in the segment,
but those objects are still present in the Squeak system.

#active				(segment is actively holding objects)
The segment is now the only holder of tree of objects.  Each of the
original roots has been transmuted into an ImageSegmentRootStub that
refers back to this image segment.  The original objects in the
segment will all be garbageCollected.

#onFile
The segment has been written out to a file and replaced by a file
pointer.  Only ImageSegmentRootStubs and the array of outPointers
remains in the image.  To get this far:
(ImageSegment new copyFromRoots: (Array with: Baz with: Baz class))
		writeToFile: 'myFile.seg'.

#inactive
The segment has been brought back into memory and turned back into
objects.  rootsArray is set, but the segment is invalid.

#onFileWithSymbols
The segment has been written out to a file, along with the text of
all the symbols in the outPointers array, and replaced by a file
pointer.  This reduces the size of the outPointers array, and also
allows the system to reclaim any symbols that are not referred to
from elsewhere in the image.  The specific format used is that of a
literal array as follows:
	#(symbol1 symbol2 # symbol3 symbol4 'symbolWithSpaces' # symbol5).
In this case, the original outPointers array was 8 long, but the
compacted table of outPointers retains only two entries.  These get
inserted in place of the #'s in the array of symbols after it is read
back in.  Symbols with embedded spaces or other strange characters
are written as strings, and converted back to symbols when read back
in.  The symbol # is never written out.
	NOTE: All IdentitySets or dictionaries must be rehashed when
being read back from this format.  The symbols are effectively
internal.  (No, not if read back into same image.  If a different
image, then use #imported.  -tk)

#imported
The segment is on an external file or just read in from one.  The
segment and outPointers are meant to be read into a foreign image.
In this form, the image segment can be read from a URL, and
installed.  A copy of the original array of root objects is
constructed, with former outPointers bound to existing objects in the
host system.
	(Any Class inside the segment MUST be in the arrayOfRoots.
This is so its association can be inserted into Smalltalk.  The
class's metaclass must be in roots also.  Methods that are in
outPointers because blocks point at them, were found and added to the
roots.
	All IdentitySets and dictionaries are rehashed when being
read back from exported segments.)


To discover why only some of the objects in a project are being
written out, try this (***Destructive Test***).  This breaks lots of
backpointers in the target project, and puts up an array of
suspicious objects, a list of the classes of the outPointers, and a
debugger.
"Close any transcripts in the target project"
World currentHand objectToPaste ifNotNil: [
	self inform: 'Hand is holding a Morph in its paste buffer:\' withCRs,
		World currentHand objectToPaste printString].
PV := Project named: 'xxxx'.
(IS := ImageSegment new) findRogueRootsImSeg:
	(Array with: PV world presenter with: PV world).
IS findOwnersOutPtrs.	"Optionally: write a file with owner chains"
"Quit and DO NOT save"

When an export image segment is brought into an image, it is like an
image starting up.  Certain startUp messages need to be run.  These
are byte and word reversals for nonPointer data that comes from a
machine of the opposite endianness.  #startUpProc passes over all
objects in the segment, and:
	The first time an instance of class X is encountered, (msg :=
X startUpFrom: anImageSegment) is sent.  If msg is nil, the usual
case, it means that instances of X do not need special work.  X is
included in the IdentitySet, noStartUpNeeded.  If msg is not nil,
store it in the dictionary, startUps (aClass -> aMessage).
	When a later instance of X is encountered, if X is in
noStartUpNeeded, do nothing.  If X is in startUps, send the message
to the instance.  Typically this is a message like #swapShortObjects.
	Every class that implements #startUp, should see if it needs
a parallel implementation of #startUpFrom:.  
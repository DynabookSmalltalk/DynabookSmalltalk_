ImageSegment is used to import old (interpreter VM era) projects into
new images. Instead of a VM primitive it uses LegacyImageSegmentLoader
to load objects from the segment. There are no methods for writing segments
 in the legacy format.

The original ImageSegment scheme used an "endMarker" object to enumerate
all objects in the segment, relying on the fact that all objects were layed out
continuously in object memory and could be traversed via #nextObject.
Since Spur makes no such guarantees the endMarker instance var has been
removed, instead the segment is converted into an Array of all objects,
so they can be enumerated.
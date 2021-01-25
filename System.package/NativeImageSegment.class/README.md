NativeImageSegment is used to save and restore projects.  It uses
one primitive to create a segment (a WordArray) whose contents
are the objects in the project in the same format as they appear in
the VM's heap.  It uses another primitive to convert a segment back
into objects.
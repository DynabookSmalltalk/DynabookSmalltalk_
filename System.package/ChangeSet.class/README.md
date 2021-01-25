ChangeSets keep track of the changes made to a system, so they can be written on a file as source code (a "fileOut").  Every project has an associated changeSet.  For simple projects, a different changeSet may be designated to capture changes at any time.

This implementation of ChangeSet is capable of remembering and manipulating methods for which the classes are not present in the system.  However at the present time, this capability is not used in normal rearranging and fileOuts, but only for invoking and revoking associated with isolation layers.

For isolated projects (see Project class comment), the changeSet binding is semi-permanent.  Every project exists in an isolation layer defined by its closest enclosing parent (or itself) that is isolated.  If a project is not isolated, then changes reported to its designated changeSet must also be reported to the permanent changeSet for that layer, designated in the isolated project.  This ensures that that outer project will be able to revert all changes upon exit.

Note that only certain changes may be reverted.  Classes may not be added, removed, renamed or reshaped except in the layer in which they are defined because these operations on non-local classes are not revertable.

If a Squeak Project is established as being isolated, then its associated changeSet will be declared to be revertable.  In this case all changes stored can be reverted.  The changeSet associated with an isolated project is tied to that project, and cannot be edited in a changeSorter.
------

name - a String used to name the changeSet, and thus any associated project or fileOut.

preamble and postscript:  two strings that serve as prefix (useful for documentation) and suffix (useful for doits) to the fileout of the changeSet.

revertable - a Boolean
If this variable is true, then all of the changes recorded by this changeSet can be reverted.

isolationSet - a ChangeSet or nil
The isolationSet is the designated changeSet for an isolation layer.  If this changeSet is an isolationSet, then this variable will be nil.  If not, then it points to the isolationSet for this layer, and all changes reported here will also be reported to the isolationSet.

isolatedProject - a Project or nil
If this is an isolationSet, then this variable points to the project with which it is associated.

changeRecords -  Dictionary {class name -> a ClassChangeRecord}.
These classChangeRecords (qv) remember all of the system changes.

structures -    Dictionary {#Rectangle -> #(<classVersionInteger> 'origin' 'corner')}.
Of  the names of the instances variables before any changes for all classes in classChanges, and all of their superclasses.  In the same format used in SmartRefStream.  Inst var names are strings.  

superclasses -    Dictionary {#Rectangle -> #Object}.
Of all classes in classChanges, and all of their superclasses.

Structures and superclasses save the instance variable names of this class and all of its superclasses.  Later we can tell how it changed and write a conversion method.  The conversion method is used when old format objects are brought in from the disk from ImageSegment files (.extSeg) or SmartRefStream files (.obj .morph .bo .sp).

NOTE:  It should be fairly simple, by adding a bit more information to the classChangeRecords, to reconstruct the information now stored in 'structures' and 'superclasses'.  This would be a welcome simplification.

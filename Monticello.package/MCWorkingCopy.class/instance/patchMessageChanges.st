operations
patchMessageChanges
	| changes |
	changes := package snapshot patchRelativeToBase: self parentSnapshot.
	^ (MCPatchMessage new patch: changes) message
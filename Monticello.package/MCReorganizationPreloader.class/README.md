MCReorganizationPreloader ensures that definitions moved between two packages are not removed temporarily, independent of their load order.

Moves appear as deletion in one package and addition in another package. If the deletion precedes the addition, the entity will be removed from the system for a short period of time, and then recreated later. This is potentially fatal.

MCReorganizationPreloader detects these problematic definitions and combines them into MCModifications. They then get 'preloaded' (applied to the system) so when the actual packages are loaded later, they become no-ops (because the definition in the image is already in the right package).

Instance Variables
	preloads:	generated modifications
	currentRemovals:		definitions removed by the version currently being added
	previousRemovals:		definitions removed by previously added versions

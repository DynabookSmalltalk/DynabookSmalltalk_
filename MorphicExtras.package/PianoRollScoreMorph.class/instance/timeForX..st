geometry
timeForX: aNumber

	^ ((aNumber - self left - self borderWidth) asFloat / timeScale + leftEdgeTime) asInteger
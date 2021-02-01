geometry
xForTime: aNumber

	^ ((aNumber - leftEdgeTime) asFloat * timeScale) asInteger + self left + self borderWidth

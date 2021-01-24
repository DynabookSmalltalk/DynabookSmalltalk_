loading
preloadMovesBetween: versions
	| loader |
	loader := self new.
	versions do: [ :version |
		loader addVersion: version].
	^ loader preload
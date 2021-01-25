examples
dotOfSize: diameter color: color

	| form |
	form := self extent: diameter asPoint depth: Display depth.
	form getCanvas fillOval: form boundingBox color: color.
	^form
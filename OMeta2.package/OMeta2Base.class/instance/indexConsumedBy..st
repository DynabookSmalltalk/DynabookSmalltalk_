private
indexConsumedBy: aBlock

	| from to |
	from := self pos.
	aBlock value.
	to := self pos.
	^ from -> to
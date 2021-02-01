private
keepIndexInView: index

	| w newStart |
	w := self bounds width - (2 * self borderWidth).
	index < startIndex ifTrue: [
		newStart := index - w + 1.
		^ self startIndex: (newStart max: 1)].
	index > (startIndex + w) ifTrue: [
		^ self startIndex: (index min: data size)].

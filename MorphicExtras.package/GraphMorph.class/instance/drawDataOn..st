private
drawDataOn: aCanvas

	| yScale baseLine x start end value left top bottom right |
	super drawOn: aCanvas.

	data isEmpty ifTrue: [^ self].
	maxVal = minVal ifTrue: [
		yScale := 1.
	] ifFalse: [
		yScale := (self bounds height - (2 * self borderWidth)) asFloat / (maxVal - minVal)].
	baseLine := self bounds bottom - self borderWidth + (minVal * yScale) truncated.
	left := top := 0. right := 10. bottom := 0.
	x := self bounds left + self borderWidth.
	start := (startIndex asInteger max: 1) min: data size.
	end := (start + self bounds width) min: data size.
	start to: end do: [:i |
		left := x truncated. right := x + 1.
		right > (self bounds right - self borderWidth) ifTrue: [^ self].
		value := (data at: i) asFloat.
		value >= 0.0 ifTrue: [
			top := baseLine - (yScale * value) truncated.
			bottom := baseLine.
		] ifFalse: [
			top := baseLine.
			bottom := baseLine - (yScale * value) truncated].
		aCanvas fillRectangle: (left@top corner: right@bottom) color: dataColor.
		x := x + 1].

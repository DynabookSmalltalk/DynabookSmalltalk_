other events
showSliderShadow

	sliderShadow color: self sliderShadowColor.
	sliderShadow cornerStyle: slider cornerStyle.
	sliderShadow privateBounds: slider bounds. "mt: Avoid #layoutChanged. See #moveSliderTo:."
	sliderShadow show.
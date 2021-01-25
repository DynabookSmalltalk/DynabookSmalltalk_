displaying
displayOn: aDisplayMedium at: aDisplayPoint clippingBox: clipRectangle rule: ruleInteger fillColor: aForm
	"For TT font, rule 34 is used if possible."
	"Refer to the comment in 
	DisplayObject|displayOn:at:clippingBox:rule:mask:."

	| form1 rule |
	form1 := self form.
	rule := (ruleInteger = Form over and: [backColor isTransparent])
				ifTrue: [form1 depth = 32 ifTrue: [rule := 34] ifFalse: [Form paint]]
				ifFalse: [ruleInteger].
	form1 depth = 32 ifTrue: [rule := 34].
	form1
		displayOn: aDisplayMedium
		at: aDisplayPoint + offset
		clippingBox: clipRectangle
		rule: rule
		fillColor: aForm
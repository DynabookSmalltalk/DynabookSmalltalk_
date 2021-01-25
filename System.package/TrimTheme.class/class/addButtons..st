instance creation
addButtons: theme

	theme
		set: #borderColor for: #PluggableButtonMorph to: self gray102;
		set: #borderWidth for: #PluggableButtonMorph to: 1;
		set: #borderStyle for: #PluggableButtonMorph to: BorderStyle simple;
		set: #color for: #PluggableButtonMorph to: self gray76;
		
		set: #textColor for: #PluggableButtonMorph to: self white;

		set: #selectionModifier for: #PluggableButtonMorph to: [ [:c | self gray39] ];
		set: #hoverModifier for: #PluggableButtonMorph to: [ [:c | self gray51] ];
		set: #feedbackModifier for: #PluggableButtonMorph to: [ [:c | self gray39] ].
	
	"And the plus-version."
	theme
		set: #disabledColor for: #PluggableButtonMorphPlus to: Color transparent;
		set: #disabledTextColor for: #PluggableButtonMorphPlus to: self gray128.
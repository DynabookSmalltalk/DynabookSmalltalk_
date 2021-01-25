as yet unclassified
groupToggleButton
	self flag: #todo.
	^(self inAColumn: {
		(ThreePhaseButtonMorph checkBox)
			target: self;
			actionSelector: #toggleChoice:;
			arguments: {'group'};
			"getSelector: #getChoice:;"
			setBalloonText: 'Changes between group mode and individuals' translated;
			step
	}) hResizing: #shrinkWrap

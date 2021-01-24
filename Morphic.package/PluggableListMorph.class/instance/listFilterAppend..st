filtering
listFilterAppend: aChar
	"Update the list filter or change selection to match the current filter expression. The given character will be appended to the current filter term."

	| milliseconds slowKeyStroke newModelIndex oldModelIndex |
	model okToChange ifFalse: [ ^ self ].

	newModelIndex := oldModelIndex := self getCurrentSelectionIndex.
	milliseconds := Time millisecondClockValue.
	slowKeyStroke := (Time
		milliseconds: milliseconds
		since: lastKeystrokeTime) > self class clearFilterDelay.
	slowKeyStroke := slowKeyStroke or:
		"For unfiltered lists, ff the users hits the same key repeatedly, support navigation regardless of the configured delay, as quickly as they want."
		[ self filterableList not and: [ lastKeystrokes size = 1 and: [ lastKeystrokes first = aChar ] ] ] .
	lastKeystrokeTime := milliseconds.

	"1) Record the key press."
	slowKeyStroke
		ifTrue:
			[ "Fresh filter expression *and* filterable lists? Keep track of that for escaping the filter."
			(self filterableList and: [self hasFilter not]) ifTrue:
				[ priorSelection := self modelIndexFor: self selectionIndex ].
			"Forget previous keystrokes and search in following elements."
			lastKeystrokes := aChar asLowercase asString.
			self filterableList ifFalse: 
				[ newModelIndex := self modelIndexFor: ((self nextSelectionIndexFrom: self selectionIndex) max: 1) ] ]
		ifFalse:
			[ "Append quick keystrokes but don't move selection if it still matches."
			lastKeystrokes := lastKeystrokes , aChar asLowercase asString.
			self filterableList ifFalse:
				[ newModelIndex := self modelIndexFor: ((self nextSelectionIndexFrom: self selectionIndex-1) max: 1) ] ].

	self filterableList ifTrue:
		[ self updateListFilter.
		newModelIndex := self modelIndexFor: 1 ].
	
	(self hasFilter and: [(self getCurrentSelectionIndex = newModelIndex) not]) ifTrue:
		[ self changeModelSelection: newModelIndex ].
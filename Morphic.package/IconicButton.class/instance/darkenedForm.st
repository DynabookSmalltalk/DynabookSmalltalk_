ui
darkenedForm
	^ darkenedForm ifNil: [ darkenedForm := self firstSubmorph baseGraphic darker ]
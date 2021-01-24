handling
openMenuIn: aBlock 
	"Ask the user which selector to choose.
	Answer the choosen selector or nil if cancellation is requested."
	
	| labels actions lines caption choice |
	labels := {
		'selector is ' , (name copyFrom: 1 to: name size - 1) , ' argument is negative'.
		'selector is ' , name , ' argument is positive'.
		'cancel'}.
	actions := {
		name copyReplaceFrom: name size to: name size - 1 with: ' '.
		name copyReplaceFrom: name size + 1 to: name size with: ' '.
		nil.
	}.
	lines := {2}.
	caption := 'Ambiguous selector: ' , name , ' please correct, or cancel:'.
	choice := aBlock value: labels value: lines value: caption.
	self resume: (actions at: choice ifAbsent: [nil])
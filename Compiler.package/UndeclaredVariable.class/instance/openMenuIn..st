as yet unclassified
openMenuIn: aBlock 
	| alternatives labels actions lines caption choice |
	alternatives := parser possibleVariablesFor: name.
	labels := OrderedCollection new.
	actions := OrderedCollection new.
	lines := OrderedCollection new.
	name first isLowercase 
		ifTrue: 
			[labels add: 'declare method temp'.
			actions add: [parser declareTemp: name at: #method].
			labels add: 'declare block-local temp'.
			actions add: [parser declareTemp: name at: #block].
			parser canDeclareInstanceVariable 
				ifTrue: 
					[labels add: 'declare instance'.
					actions add: [parser declareInstVar: name]]]
		ifFalse: 
			[labels add: 'define new class'.
			actions add: [parser defineClass: name].
			labels add: 'declare global'.
			actions add: [parser declareGlobal: name].
			parser canDeclareClassVariable 
				ifTrue: 
					[labels add: 'declare class variable'.
					actions add: [parser declareClassVar: name]]].
	lines add: labels size.
	alternatives do: 
		[:each | 
		labels add: each.
		actions add: [parser substituteVariable: each atInterval: interval]].
	lines add: labels size.
	labels add: 'cancel'.
	caption := 'Unknown variable: ' , name , ' please correct, or cancel:'.
	choice := aBlock value: labels value: lines value: caption.
	self resume: (actions at: choice ifAbsent: [nil])
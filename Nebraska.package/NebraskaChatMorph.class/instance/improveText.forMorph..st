as yet unclassified
improveText: someText forMorph: aMorph

	| betterText conversions fontForAll |

	fontForAll := aMorph eToyGetMainFont.
	betterText := someText veryDeepCopy.
	conversions := OrderedCollection new.
	betterText runs withStartStopAndValueDo: [:start :stop :attributes |
		attributes do: [:att |
			(att isMemberOf: TextFontChange) ifTrue: [
				conversions add: {att. start. stop}
			]
		]
	].
	conversions do: [ :old |
		| newAttr |
		betterText removeAttribute: old first from: old second to: old third.
		newAttr := TextFontReference toFont: (fontForAll fontAt: old first fontNumber).
		newAttr fontNumber: old first fontNumber.
		betterText addAttribute: newAttr from: old second to: old third.
	].
	^betterText
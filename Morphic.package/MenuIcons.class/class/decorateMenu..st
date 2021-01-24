menu decoration
decorateMenu: aMenu 
	"decorate aMenu with icons"

	| maxWidth |

	Preferences menuWithIcons ifFalse: [^ self].
	Preferences tinyDisplay ifTrue:[^ self].

	maxWidth := 0.

	aMenu items do: [:item | 
		item icon isNil ifTrue: [
			| icon | 
			icon := self iconForMenuItem: item.
			icon isNil ifFalse: [
				item icon: icon.
				maxWidth := maxWidth max: item icon width.
			]
		]
		ifFalse: [
			maxWidth := maxWidth max: item icon width
		].

		item hasSubMenu ifTrue: [
			self decorateMenu: item subMenu.
		].
	].

	maxWidth isZero ifFalse: [
		self flag: #hacky. "mt: That manual icon scaling is not optimal..."
		aMenu addBlankIconsIfNecessary: (self blankIconOfWidth: (
			"Avoid duplicate scaling because the actual menu icons are already scaled at this point."
			RealEstateAgent scaleFactor > 1.0
				ifTrue: [RealEstateAgent defaultIconExtent x]
				ifFalse: [maxWidth]))].

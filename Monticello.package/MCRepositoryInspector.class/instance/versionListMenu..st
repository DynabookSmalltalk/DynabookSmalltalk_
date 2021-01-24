morphic ui
versionListMenu: aMenu
	1 to: self orderSpecs size do: [ :index |
		aMenu addUpdating: #orderString: target: self selector: #order: argumentList: { index } ].
	aMenu addLine.
	aMenu add: 'Changes against ...' action: [| ri |
		ri := aMenu defaultTarget.
		(UIManager default
			chooseFrom: ri versionList
			values: ri versionList
			title: 'Select version to show patch against ...') ifNotNil: [:name |
			| versionName target base |
			versionName := MCVersionName on: name.
			target := ri repository versionNamed: ri versionInfo name.
			base := aMenu defaultTarget repository versionNamed: versionName.
			(MCPatchBrowser
				forPatch: (target snapshot patchRelativeToBase: base snapshot))
			showLabelled: 'Changes from ', versionName, ' to ', ri versionInfo name]].
	^aMenu
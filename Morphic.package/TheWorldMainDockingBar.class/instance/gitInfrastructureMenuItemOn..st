submenu - tools
gitInfrastructureMenuItemOn: menu

	menu addItem: [:item |
			item
				contents: ((Smalltalk hasClassNamed: #SquitBrowser)
					ifTrue: ['Git Browser' translated]
					ifFalse: ['Git Browser (click to install)' translated]);
				help: 'Browse repositories on github.com' translated;
				icon: (self colorIcon: ((Smalltalk classNamed: #SquitBrowser) ifNil: Model)
										basicNew windowColorToUse);			
				target: self;
				selector: #installAndOpenGitBrowser]
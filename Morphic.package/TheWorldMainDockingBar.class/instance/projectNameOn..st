right side
projectNameOn: aDockingBar
	
	aDockingBar addUpdatingItem: [:item |
		item
			help: 'Browse this project''s changes';
			target: self;
			selector: #browseChanges;
			wordingProvider: self
			wordingSelector: #browseChangesLabel].
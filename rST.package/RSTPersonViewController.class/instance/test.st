testing
test
	| testName testEMail ok |
	ok _ true.
	self model: person.
	""
	testName _ 'Diego Gomez Deck'.
	person name: testName.
	lastName = testName
		ifFalse: [""
			Transcript show: '*** INVALID LAST NAME ***';
				 cr.
			ok _ false].
	""
	testEMail _ 'DiegoGomezDeck@ConsultAr.com'.
	person eMail: testEMail.
	lastEMail = testEMail
		ifFalse: [""
			Transcript show: '*** INVALID LAST EMAIL ***';
				 cr.
			ok _ false].
	""
	self model: nil.
	^ ok
accessing
keywordMsg =

	keywordMsgPart*:x -> ['perform: #''', (targetNamespace mangleMethod:((x collect: #first) joinSeparatedBy: ':')), ''' withArguments: {',((x collect: #second) joinSeparatedBy: '.') ,'}']
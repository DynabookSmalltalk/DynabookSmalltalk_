rules
app =

	symbol:rule
	(	anything+:args [self delim: args with: '. ']:args -> [{'(self apply: '. rule storeString. ' withArgs: {'. args. '})'}]
	|	[{'(self apply: '. rule storeString. ')'}]
	)
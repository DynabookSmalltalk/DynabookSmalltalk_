rules
superapp =

	symbol:rule anything*:args
	[self delim: args with: '. ']:args
	-> [{'(self super: '. grammarClass superclass name. ' apply: '. rule storeString. ' withArgs: {'. args. '})'}]
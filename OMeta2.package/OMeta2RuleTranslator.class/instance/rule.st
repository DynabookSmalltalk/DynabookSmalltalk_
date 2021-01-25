rules
rule =

	symbol:name
	anything:temps [temps select: [:t | (grammarClass instVarNames includes: t) not]]:temps
	trans:body
	-> [{name. ' |'. self delim: temps asSortedCollection with: ' '. ' | ^ '. body}]
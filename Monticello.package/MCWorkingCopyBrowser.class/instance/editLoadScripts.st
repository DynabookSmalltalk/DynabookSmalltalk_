morphic ui
editLoadScripts

	| arg |
	self hasWorkingCopy ifFalse: [^self].
	arg := UIManager default
		chooseFrom: #('edit preamble' 'edit postscript' 'edit preambleOfRemoval' 'edit postscriptOfRemoval')
		values: #(#preamble #postscript #preambleOfRemoval #postscriptOfRemoval).

	arg ifNotNil: [
		self editScript: arg].
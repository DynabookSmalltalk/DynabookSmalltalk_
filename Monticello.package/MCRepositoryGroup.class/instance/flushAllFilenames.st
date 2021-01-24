private
flushAllFilenames
	self repositories do: [ : each | each flushAllFilenames ]
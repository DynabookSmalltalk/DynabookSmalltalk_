menu messages
lineSelectAndEmptyCheck: returnBlock
	"If the current selection is an insertion point, expand it to be the entire current line; if after that's done the selection is still empty, then evaluate the returnBlock, which will typically consist of '[^ self]' in the caller -- check senders of this method to understand this."

	self hasSelection ifFalse: [
		self selectLine.
		self hasSelection ifFalse: [
			morph flash. 
			^ returnBlock value]].
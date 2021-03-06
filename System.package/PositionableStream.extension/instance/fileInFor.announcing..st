*System-Changes-fileIn/Out
fileInFor: client announcing: announcement
	"This is special for reading expressions from text that has been formatted 
	with exclamation delimitors. The expressions are read and passed to the 
	Compiler. Answer the result of compilation.  Put up a progress report with
     the given announcement as the title.
	Does NOT handle preambles or postscripts specially."
	| val |
	announcement
		displayProgressFrom: 0
		to: self size
		during:
		[:bar |
		[self atEnd]
			whileFalse: 
				[bar value: self position.
				self skipSeparators.
				[ | chunk |
				val := (self peekFor: $!) ifTrue: [
						(Compiler evaluate: self nextChunk for: client logged: false) scanFrom: self
					] ifFalse: [
						chunk := self nextChunk.
						self checkForPreamble: chunk.
						Compiler evaluate: chunk for: client logged: true ].
				] on: InMidstOfFileinNotification
				  do: [ :ex | ex resume: true].
				self atEnd ifFalse: [ self skipStyleChunk ]].
		self close].
	"Note:  The main purpose of this banner is to flush the changes file."
	Smalltalk logChange: '----End fileIn of ' , self name , '----'.
	^ val
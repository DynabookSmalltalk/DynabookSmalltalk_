installing
load
	 self createClass ifNotNil:
		[:class |
		class class instanceVariableNames: self classInstanceVariablesString.
		self hasComment ifTrue: [class classComment: comment stamp: commentStamp]]
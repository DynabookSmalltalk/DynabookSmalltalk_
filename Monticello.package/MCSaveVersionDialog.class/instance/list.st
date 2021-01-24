accessing
list
  ^ self items collect: [:each |
        (self reverts includes: each)
            ifFalse: [(self ignore includes: each)
                        ifFalse: [each summary]
                        ifTrue: [Text
					string: '( ', each summary, ' )'
					attributes: (self userInterfaceTheme ignoredOperationAttributes ifNil: [{TextColor color: Color gray}])]]
            ifTrue: [Text
			string: '( ', each summary, ' )'
			attributes: (self userInterfaceTheme revertedOperationAttributes ifNil: [ {TextEmphasis struckOut} ]) ]]
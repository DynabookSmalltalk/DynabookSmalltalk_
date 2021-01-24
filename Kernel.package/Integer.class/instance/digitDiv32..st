private
digitDiv32: anInteger
	
	^(self digitDiv: anInteger neg: false) collect: #normalize
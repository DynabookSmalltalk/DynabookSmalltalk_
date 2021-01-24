accessing
contents

	^ contents	ifNil: [ self contents: 'String Morph'. contents ]

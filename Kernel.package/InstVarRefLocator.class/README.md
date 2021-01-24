My job is to scan bytecodes for instance variable references.

BlockClosure allInstances collect: [ :x |
	{x. x method hasInstVarRef}
]
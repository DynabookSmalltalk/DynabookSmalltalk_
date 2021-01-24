operations
unregisterSubpackages
	(self class registry keys
		select: [:p | self packageName , '-*' match: p name])
		do: [:k | self class registry removeKey: k]
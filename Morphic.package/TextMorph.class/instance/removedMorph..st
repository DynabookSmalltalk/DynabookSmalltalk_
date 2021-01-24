private
removedMorph: aMorph
	| range |
	range := text find: (TextAnchor new anchoredMorph: aMorph).
	range ifNotNil: [
		self paragraph 
			replaceFrom: range first 
			to: range last
			with: Text new 
			displaying: false.
		self fit].
	super removedMorph: aMorph.
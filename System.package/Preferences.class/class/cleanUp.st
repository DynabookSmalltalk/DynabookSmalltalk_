class initialization
cleanUp

	"Synchronize the cache for pragma preferences. Note that the actual preferences values are stored in class variables. So, no such value gets lost if we remove all such preferences from that cache."
	self removeAllPreferencesSuchThat: [:preference |
		preference isPragmaPreference].
	SystemNavigation default allSelectorsAndMethodsDo: [:behavior :selector :method |
		method pragmas do: [:pragma |
			self addPragmaPreference: pragma]].
	
	"Remove obsolete (non-pragma) preferences."
	self removeObsolete.

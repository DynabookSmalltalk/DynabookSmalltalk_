accessing
arguments
	"Answer the receiver's arguments as an Array.
	 We could use simply ^(1 to: self numArgs) collect: [:i| self tempAt: i]
	 but for performance and minimality we use the implementation below."
	| n args |
	args := Array new: (n := self numArgs).
	1 to: n do: [:i| args at: i put: (self tempAt: i)].
	^args
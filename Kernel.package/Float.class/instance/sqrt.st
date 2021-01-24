mathematical functions
sqrt
	"Fallback code for absent primitives.
	Care to answer a correctly rounded result as mandated by IEEE-754."
	
	| guess selfScaled nextGuess exp secator hi lo remainder maxError |
	self <= 0.0
		ifTrue: [self = 0.0
				ifTrue: [^ self]
				ifFalse: [^ DomainError signal: 'sqrt undefined for number less than zero.']].
	self isFinite ifFalse: [^self].
	
	"scale to avoid loss of precision in case of gradual underflow
	(selfScaled between: 1.0 and: 2.0), so it is a good guess by itself"
	exp := self exponent // 2.
	guess := selfScaled := self timesTwoPower: exp * -2.
	
	"Use Newton-Raphson iteration - it converges quadratically
	(twice many correct bits at each loop)"
	[nextGuess := selfScaled - (guess * guess) / (2.0 * guess) + guess.
	"test if both guess are within 1 ulp"
	(nextGuess + guess) / 2.0  = guess]
		whileFalse: 
			["always round odd upper - this avoids infinite loop with alternate flip of last bit"
			guess := nextGuess + (nextGuess ulp/2.0)].
	
	"adjust the rounding - the guess can be 2 ulp up or 1 ulp down
	Let u = guess ulp.
	if (guess+u/2)^2<self, then guess is under-estimated
	if (guess-u/2)^2>self, then guess is over-estimated
	Note that they can't be equal (because left term has 55 bits).
	(guess+u/2)^2=guess^2 + guess*u + u^2/4 < self
	==> self - guess^2 > guess*u
	(guess-u/2)^2=guess^2 - guess*u + u^2/4 > self
	==> guess^2 - self >= guess*u
	(guess^2 - self) is evaluated with an emulated fused-multiply-add"
	
	["Decompose guess in two 26 bits parts hi,lo
	the trick is that they do not necessarily have the same sign
	If 53 bits are hi,0,lo => (hi,lo) else hi,1,lo=> (hi+1,-lo)"
	secator := "1<<27+1" 134217729.0.
	hi := guess * secator.
	hi :=hi + (guess - hi).
	lo := guess - hi.
	
	"The operations below are all exact"
	remainder := selfScaled - hi squared - (hi * lo * 2.0) - lo squared.
	maxError := guess timesTwoPower: 1 - Float precision.
	remainder > maxError or: [remainder negated >= maxError]]
			whileTrue: [guess :=remainder > 0.0
				ifTrue: [guess successor]
				ifFalse: [guess predecessor]].
	
	"undo the scaling"
	^ guess timesTwoPower: exp
events
balanceOffsets

	| fdx fdy |

	(self hasProperty: #fullDelta) ifFalse: [^ self].

	fdx := (self valueOfProperty: #fullDelta) x.
	fdy := (self valueOfProperty: #fullDelta) y.

	self layoutFrame hasFixedHeight ifTrue: [
		| otop obot ctop cbot topf |

		otop := (owner submorphs detect: [:m | 
					m layoutFrame topFraction isZero] ifNone: [^ self]) in: [:tm | 
						tm top - (tm layoutFrame topOffset ifNil: [0])].

		obot := (owner submorphs detect: [:m | 
					m layoutFrame bottomFraction = 1] ifNone: [^ self]) in: [:tm | 
						tm bottom - (tm layoutFrame bottomOffset ifNil: [0])].

		ctop := (self layoutFrame topFraction * (obot - otop)) rounded 
					+ otop + (self layoutFrame topOffset ifNil: [0]).
		cbot := (self layoutFrame bottomFraction * (obot - otop)) rounded 
					+ otop + (self layoutFrame bottomOffset ifNil: [0]).

		topf := self layoutFrame topFraction.
		self layoutFrame topFraction:  ((ctop + cbot) * 0.5 - otop) / (obot - otop) asFloat.
		self layoutFrame bottomFraction: self layoutFrame topFraction.
		self layoutFrame topOffset: self layoutFrame topOffset - fdy.
		self layoutFrame bottomOffset: self layoutFrame bottomOffset - fdy.

		(leftOrTop copy union: rightOrBottom) do: [:m |
			(m layoutFrame topFraction closeTo: topf) ifTrue: [
				m layoutFrame topFraction: self layoutFrame topFraction.
				m layoutFrame topOffset: m layoutFrame topOffset - fdy].
			(m layoutFrame bottomFraction closeTo: topf) ifTrue: [
				m layoutFrame bottomFraction: self layoutFrame topFraction.
				m layoutFrame bottomOffset: m layoutFrame bottomOffset - fdy]]] .

	self layoutFrame hasFixedWidth ifTrue: [
		| oleft oright cleft cright leftf |

		oleft := (owner submorphs detect: [:m | 
			m layoutFrame leftFraction isZero] ifNone: [^ self]) in: [:tm | 
				tm left - (tm layoutFrame leftOffset ifNil: [0])].

		oright := (owner submorphs detect: [:m | 
			m layoutFrame rightFraction = 1] ifNone: [^ self]) in: [:tm | 
				tm right - (tm layoutFrame rightOffset ifNil: [0])].

		cleft := (self layoutFrame leftFraction * (oright - oleft)) rounded 
					+ oleft + (self layoutFrame leftOffset ifNil: [0]).
		cright := (self layoutFrame rightFraction * (oright - oleft)) rounded 
					+ oleft + (self layoutFrame rightOffset ifNil: [0]).

		leftf := self layoutFrame leftFraction.
		self layoutFrame leftFraction: ((cleft + cright) * 0.5 - oleft) / (oright - oleft) asFloat.
		self layoutFrame rightFraction: self layoutFrame leftFraction.


		self layoutFrame leftOffset: self layoutFrame leftOffset - fdx.
		self layoutFrame rightOffset: self layoutFrame rightOffset - fdx.

		(leftOrTop copy union: rightOrBottom) do: [:m |
			(m layoutFrame leftFraction closeTo: leftf) ifTrue: [
				m layoutFrame leftFraction: self layoutFrame leftFraction.
				m layoutFrame leftOffset: m layoutFrame leftOffset - fdx].
			(m layoutFrame rightFraction closeTo: leftf) ifTrue: [
				m layoutFrame rightFraction: self layoutFrame leftFraction.
				m layoutFrame rightOffset: 	m layoutFrame rightOffset - fdx.]]] .
		
	self removeProperty: #fullDelta.
	owner layoutChanged

converting-private
preenNilNodeFollowingNilIfNode: aNilIfMessageNode
	self nodesDo:
		[:node| | statements indices |
		 (node isBlockNode
		  and: [(statements := node statements) includes: aNilIfMessageNode]) ifTrue:
			[indices := (2 to: statements size) reject:
							[:i|
							(statements at: i) == NodeNil
							and: [(statements at: i - 1) isNilIf]].
			 node statements: (({1}, indices) collect: [:i| statements at: i])]]
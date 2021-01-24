converting-private
preenTempsConflictingWithBlockNode: temps
	"Push temps that conflict with other blocks down into their narrowest enclosing block scope."
	temps do:
		[:tempVar|
		(self accept: (NarrowerVariableScopeFinder new ofVariable: tempVar)) ifNotNil:
			[:enclosingScope |
			 self assert: enclosingScope isBlockNode.
			 self nodesDo:
				[:node|
				 ((node == self or: [node isBlockNode])
				  and: [node temporaries includes: tempVar]) ifTrue:
					[node temporaries: (node temporaries copyWithout: tempVar)]].
			 enclosingScope temporaries: enclosingScope temporaries, { tempVar }]]
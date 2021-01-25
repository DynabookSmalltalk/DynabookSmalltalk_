private
many1: aBlock

	^ self genericMany: aBlock into: (OrderedCollection with: aBlock value)
decoding
drawImage: command 
	| image point sourceRect rule cacheID cacheNew previousImage |
	image := self class decodeImage: command second.
	point := self class decodePoint: command third.
	sourceRect := self class decodeRectangle: command fourth.
	rule := self class decodeInteger: command fifth.
	command size >= 7 
		ifTrue: 
			[false ifTrue: [self showSpaceUsed].	"debugging"
			cacheID := self class decodeInteger: (command sixth).
			cacheNew := (self class decodeInteger: command seventh) = 1.
			cacheID > 0 
				ifTrue: 
					[
					cacheNew 
						ifTrue: [CachedForms at: cacheID put: image]
						ifFalse: 
							[previousImage := CachedForms at: cacheID.
							image ifNil: [image := previousImage]
								ifNotNil: 
									[(previousImage notNil and: [image depth > 8]) 
										ifTrue: [image := previousImage addDeltasFrom: image].
									CachedForms at: cacheID put: image]]]].
	self drawCommand: 
			[:c | 
			c 
				image: image
				at: point
				sourceRect: sourceRect
				rule: rule]
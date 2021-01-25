drawing
purgeCacheInner

	| totalSize |

	cachedObjects ifNil: [^0].
	totalSize := 0.
	cachedObjects withIndexDo: [ :each :index | | cachedObject thisSize |
		cachedObject := each first first.
		cachedObject ifNil: [
			each second ifNotNil: [
				2 to: each size do: [ :j | each at: j put: nil].
				self sendCommand: {
					String with: CanvasEncoder codeReleaseCache.
					self class encodeInteger: index.
				}.
			].
		] ifNotNil: [
			thisSize := cachedObject depth * cachedObject width * cachedObject height // 8.
			totalSize := totalSize + thisSize.
		].
	].
	^totalSize
	"---
	newEntry := {
		WeakArray with: anObject.
		1.
		Time millisecondClockValue.
		nil.
	}.
	---"

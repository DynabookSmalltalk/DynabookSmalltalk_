read/write segment
rootsIncludingBlocks
	"For export segments only.  Return a new roots array with more objects.  (Caller should store into rootArray.)  Collect Blocks and external methods pointed to by them.  Put them into the roots list.  Then ask for the segment again."

	| extras have |
	userRootCnt ifNil: [userRootCnt := arrayOfRoots size].
	extras := OrderedCollection new.
	outPointers do: [:anOut | 
		anOut class == CompiledMethod ifTrue: [extras add: anOut].
		(anOut isBlock) ifTrue: [extras add: anOut].
		(anOut class == MethodContext) ifTrue: [extras add: anOut]].

	[have := extras size.
	 extras copy do: [:anOut |
		anOut isBlock ifTrue: [
			anOut home ifNotNil: [
				(extras includes: anOut home) ifFalse: [extras add: anOut home]]].
		(anOut class == MethodContext) ifTrue: [
			anOut method ifNotNil: [
				(extras includes: anOut method) ifFalse: [extras add: anOut method]]]].
	 have = extras size] whileFalse.
	extras := extras select: [:ea | (arrayOfRoots includes: ea) not].
	extras isEmpty ifTrue: [^ nil].	"no change"

	^ arrayOfRoots, extras
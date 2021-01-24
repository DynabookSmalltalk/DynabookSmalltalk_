private
readStreamForFileNamed: aString do: aBlock

	| contents attempts|
	attempts := 0.
	self displayProgress: 'Downloading ', aString during: [
		[attempts := attempts + 1.
		contents := self httpGet: (self urlForFileNamed: aString) arguments: nil] on: NetworkError do: [:ex| 
		attempts >= 3 ifTrue:[ex pass].
		ex retry ]].
	^contents ifNotNil: [ aBlock value: contents ]
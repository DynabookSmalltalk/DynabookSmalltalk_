downloading
downloadState: baseUrl 
	|  sourceUrl imageSource |

	image ifNil: [ 
		sourceUrl := self src.
		sourceUrl ifNotNil: [ 
			imageSource := HTTPSocket httpGetDocument: (sourceUrl asUrlRelativeTo: baseUrl asUrl) toText.
			imageSource contentType = 'image/gif'  ifTrue: [
				[image := (GIFReadWriter on: (RWBinaryOrTextStream with: imageSource content) reset binary) nextImage ]
				ifError: [ :a :b |  "could not decode--ignore it"  image := nil ] ].
			 ] ].

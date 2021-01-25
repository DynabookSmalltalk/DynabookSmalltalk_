private
print: aString withAttributes: attributes on: stream

	stream
		currentAttributes: attributes;
		nextPutAll: aString
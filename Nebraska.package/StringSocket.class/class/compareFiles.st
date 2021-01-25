as yet unclassified
compareFiles
"
StringSocket compareFiles
"
	| data1 data2 |

	data1 := (FileStream fileNamed: 'Macintosh HD:bob:nebraska test:58984048.1')
			contentsOfEntireFile.
	data2 := (FileStream fileNamed: 'BobsG3:squeak:dsqueak:DSqueak2.7 folder:58795431.3')
			contentsOfEntireFile.
	1 to: (data1 size min: data2 size) do: [ :i |
		(data1 at: i) = (data2 at: i) ifFalse: [self halt].
	].

accessing
merger: aMerger
	merger := aMerger.
	items := aMerger operations sorted.
	conflicts := aMerger conflicts sort: [:a :b | a operation <= b operation].
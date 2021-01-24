TextAnchors support anchoring of images in text. A TextAnchor exists as an attribute of text emphasis. Depending on whether its anchoredMorph is a Morph or a Form, it repositions the morph, or displays the form respectively.  The coordination between composition, display, and selection can best be understood by browsing the various implementations of placeEmbeddedObjectFrom:.

In the morphic world, you can embed any form or morph in text by adding a startOfHeader character and adding the TextAnchor attribute to it.

	Workspace new
		contents: (Text withAll: 'foo') , (Text string: Character startOfHeader asString attribute: (TextAnchor new anchoredMorph: MenuIcons confirmIcon)) , (Text withAll: 'bar');
		openLabel: 'Text with Form'.

	Workspace new
		contents: (Text withAll: 'foo') , (Text string: Character startOfHeader asString attribute: (TextAnchor new anchoredMorph: EllipseMorph new)) , (Text withAll: 'bar');
		openLabel: 'Text with Morph'.
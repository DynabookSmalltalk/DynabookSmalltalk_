menus
copyListToClipboard
	"Copy my items to the clipboard as a multi-line string"

	Clipboard clipboardText: (
		String streamContents: [:stream |
			1 to: self listSize do: [:viewIndex |
				stream nextPutAll: (self itemAt: viewIndex) asString; cr]]).
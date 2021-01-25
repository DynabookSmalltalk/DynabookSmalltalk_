utilities
fontSizeSummaryContents

	^ Text streamContents:
		[:aStream |
			self knownTextStyles do: [:aStyleName |
				aStream nextPutAll:
					(aStyleName  asText addAttribute: (TextFontReference toFont: (TextStyle named: aStyleName) defaultFont)), '  ',
					(self fontPointSizesFor: aStyleName) asArray storeString.
				aStream cr]].
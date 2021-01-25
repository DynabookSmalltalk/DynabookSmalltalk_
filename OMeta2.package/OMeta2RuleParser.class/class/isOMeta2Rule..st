as yet unclassified
isOMeta2Rule: aString

	^ [(self matchAll: aString with: #rule) first ~= #Squeak] on: OM2Fail do: [false]
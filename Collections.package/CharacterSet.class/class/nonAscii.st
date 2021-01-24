accessing
nonAscii
	"return a set containing all the non ASCII characters"

	^NonAscii ifNil: [ NonAscii := self ascii complement ]
initialize
reset
	"Prepare or clean-up internal buffers, but keep external (or host) clipboard as is."

	contents := '' asText.
	recent := OrderedCollection new.
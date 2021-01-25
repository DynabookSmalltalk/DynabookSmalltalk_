as yet unclassified
matchAll: aSequenceableCollection with: aRule withArgs: args

	^ self matchStream: aSequenceableCollection readStream with: aRule withArgs: args withPlaybackDebugging: false
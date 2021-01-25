as yet unclassified
debugMatchAll: aSequenceableCollection with: aRule withArgs: args

	^ self matchStream: aSequenceableCollection readStream with: aRule withArgs: args withPlaybackDebugging: true
as yet unclassified
playNextAudioMessage

	(self newAudioMessages nextOrNil ifNil: [^self]) asSound play.
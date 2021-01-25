as yet unclassified
handleNewAudioChat2From: dataStream sentBy: senderName ipAddress: ipAddressString

	| newSound seqSound compressed |

	compressed := self newCompressedSoundFrom: dataStream.
	newSound := compressed asSound.
"-------an experiment to try
newSound adjustVolumeTo: 7.0 overMSecs: 10
--------"
DebugLog ifNotNil: [
	DebugLog add: {compressed. newSound}.
].
	LiveMessages ifNil: [LiveMessages := Dictionary new].
	seqSound := LiveMessages at: ipAddressString ifAbsentPut: [SequentialSound new].
	seqSound isPlaying ifTrue: [
		seqSound
			add: newSound;
			pruneFinishedSounds.
	] ifFalse: [
		seqSound
			initialize;
			add: newSound.
	].
	seqSound isPlaying ifFalse: [seqSound play].
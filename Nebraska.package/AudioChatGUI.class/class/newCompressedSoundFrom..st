as yet unclassified
newCompressedSoundFrom: dataStream

	| samplingRate |

	samplingRate := (dataStream upTo: 0 asCharacter) asNumber.
	^CompressedSoundData new 
		withEToySound: dataStream upToEnd
		samplingRate: samplingRate.

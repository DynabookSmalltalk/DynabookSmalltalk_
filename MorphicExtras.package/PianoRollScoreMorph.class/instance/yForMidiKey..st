geometry
yForMidiKey: midiKey

	^ (self bottom - self borderWidth - 4) - (3 * (midiKey - lowestNote))

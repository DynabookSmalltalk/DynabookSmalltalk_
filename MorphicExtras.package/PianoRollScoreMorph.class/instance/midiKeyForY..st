geometry
midiKeyForY: y

	^ lowestNote - ((y - (bounds bottom - self borderWidth - 4)) // 3)

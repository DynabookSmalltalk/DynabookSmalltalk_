private
noCheckNoGrowFillFrom: anArray
	"Add the elements of anArray except nils to me assuming that I don't contain any of them, they are unique and I have more free space than they require."

	tally := 0.
	1 to: anArray size do: [ :index |
		(anArray at: index) ifNotNil: [ :association |
			association == vacuum ifFalse: [
				array
					at: (self scanForEmptySlotFor: association key)
					put: association.
				tally := tally + 1 ] ] ]
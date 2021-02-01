private
addToOrder: anItem
	nondeferred add: anItem.
	anItem provisions do: [:ea | self addProvision: ea].
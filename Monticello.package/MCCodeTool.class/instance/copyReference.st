menus
copyReference
	"Copy the selected selector to the clipboard"
	self selectedMessageName ifNotNil:
		[ : selector | Clipboard clipboardText:
			(self selectedClassOrMetaClass
				ifNil: [ selector asString ]
				ifNotNilDo: [ : cls | (cls >> selector) reference ]) ]
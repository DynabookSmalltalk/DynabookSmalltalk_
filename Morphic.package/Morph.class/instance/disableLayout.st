layout-properties
disableLayout
	"Layout specific. Disable laying out the receiver in a layout"
	| props |
	props := self layoutProperties.
	^props ifNil:[false] ifNotNil:[props disableLayout].
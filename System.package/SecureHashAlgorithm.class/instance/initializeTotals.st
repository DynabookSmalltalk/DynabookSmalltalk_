private
initializeTotals
	"Initialize totalA through totalE to their seed values."

	totals
		ifNil: [
			"total registers for use when primitives are absent"
			totalA loadFrom: TA.
			totalB loadFrom: TB.
			totalC loadFrom: TC.
			totalD loadFrom: TD.
			totalE loadFrom: TE ]
		ifNotNil: [
			totals
				replaceFrom: 1
				to: totals size
				with: TI
				startingAt: 1 ]
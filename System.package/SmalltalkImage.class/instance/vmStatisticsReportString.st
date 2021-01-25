vm statistics
vmStatisticsReportString
	"(Workspace new contents: Smalltalk vmStatisticsReportString)
		openLabel: 'VM Statistics'"
	"StringHolderView
		open: (StringHolder new contents: Smalltalk vmStatisticsReportString)
		label: 'VM Statistics'"

	^String new: 2048 streamContents: [:s| self vmStatisticsReportOn: s]
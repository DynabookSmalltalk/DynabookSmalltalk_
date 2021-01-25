as yet unclassified
instanceReport	"for cleaning up Alan's demo"
"
EToySenderMorph instanceReport
"
	| answer resp |

	Smalltalk garbageCollect.
	answer := self allInstances replace: [ :each |
		{
			each.
			[each ipAddress] on: Error do: [ 'no ipAddress'].
			each owner 
					ifNil: ['* no owner *'] 
					ifNotNil: [each owner innocuousName,' ',each owner printString].
			each world ifNil: ['-----no project-----'] ifNotNil: [each world project name].
		}
	].
	resp := (PopUpMenu labels: 'IP Address\Project\Owner' translated withCRs) startUpWithCaption: 
					'Sorted by' translated.
	resp = 1 ifTrue: [
		^(answer sort: [ :a :b | a second <= b second]) explore
	].
	resp = 2 ifTrue: [
		^(answer sort: [ :a :b | a fourth <= b fourth]) explore
	].
	resp = 3 ifTrue: [
		^(answer sort: [ :a :b | a third <= b third]) explore
	].
	answer explore
preferences
ignoreLineEndings
	"Answer a boolean telling if line endings differences should be ignored or emphasized"
	
	<preference: 'ignoreLineEndings'
		category: 'TextDiff'
		description: 'When enabled, source code differences in line endings will be ignored.'
		type: #Boolean>
	^IgnoreLineEndings ifNil: [ false ]
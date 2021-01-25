I implement the diff algorithm. I can show the differences between two texts. See my method comments for further information.

Instance Variables
	xLines:				<Array>
	yLines:				<Array>
	ignoreLineEndings:	<Boolean>

xLines
	- an Array of DiffElements which is created from the first input text

yLines
	- an Array of DiffElements which is created from the second input text
	
ignoreLineEndings
	- a Boolean describing whether lines only differing in the line endings should be reported as a difference, or not
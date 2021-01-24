fileIn/fileOut
writeScanOn: strm
	"Implement this method for a text attribute to define how it it should be written
	to a serialized form of a text object. The form should correspond to the source
	file format, i.e. use a scan character to denote its subclass.
	As TextAttributes are stored in RunArrays, this method is mostly called from RunArray>>#write scan.
	For reading the written information see TextAttribute class>>#scanFrom:"
	
	"Do nothing because of abstract class"
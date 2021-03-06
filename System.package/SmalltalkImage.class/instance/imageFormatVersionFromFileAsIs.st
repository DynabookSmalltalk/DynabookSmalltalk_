image
imageFormatVersionFromFileAsIs
	"Answer an integer identifying the type of image on file. The image version number may
	identify the format of the image (e.g. 32 or 64-bit word size) or specific requirements
	of the image (e.g. block closure support required). If the image file has a different
	endianness than the VM, the format version will appear byte-swapped."

	"Smalltalk image imageFormatVersionFromFileAsIs"

	^(FileStream readOnlyFileNamed: Smalltalk imageName do: [ :file | file binary; next: 4 ])
		unsignedLongAt: 1 bigEndian: Smalltalk isBigEndian
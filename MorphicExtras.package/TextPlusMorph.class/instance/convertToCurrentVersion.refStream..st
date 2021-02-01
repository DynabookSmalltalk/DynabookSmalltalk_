objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	"Fix up misaligned entries from varDict in old project"
	varDict at: 'slotName' ifPresent: [ :x | text:= x]. "Not sure why the text is in 'slotName'"
	varDict at: 'model' ifPresent: [ :x | textStyle:= x]."Or why textStyle is in 'model'"
	self releaseParagraphReally.
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm.


common requests
initializeCommonRequestStrings
	"Initialize the common request strings, a directly-editable list of expressions that can be evaluated from the 'do...' menu."

	CommonRequestStrings := StringHolder new contents: 
'Utilities emergencyCollapse.
Utilities closeAllDebuggers.
RecentMessages default revertMostRecent.
-
MCFileBasedRepository flushAllCaches
-
Sensor keyboard.
ParagraphEditor abandonChangeText.
Cursor normal show.
-
CommandHistory resetAllHistory.
Project allInstancesDo: [:p | p displayDepth: 16].
ScriptingSystem inspectFormDictionary.
Form fromUser bitEdit.
Display border: (0@0 extent: 640@480) width: 2.
-
Undeclared inspect.
Undeclared removeUnreferencedKeys; inspect.
Transcript clear.
GIFReadWriter grabScreenAndSaveOnDisk.
FrameRateMorph new openInHand.
-
Utilities reconstructTextWindowsFromFileNamed: ''TW''.
Utilities storeTextWindowContentsToFileNamed: ''TW''.
ChangeSet removeEmptyUnnamedChangeSets.
ChangesOrganizer reorderChangeSets.
-
ActiveWorld installVectorVocabulary.
ActiveWorld abandonVocabularyPreference.'

"Utilities initializeCommonRequestStrings"
instance creation
addWindowColors: theme
	
	| windowColorBrightnessAdjustment |
	windowColorBrightnessAdjustment := -0.35.
	theme 
		set: #titleFont for: #SystemWindow to: [Preferences windowTitleFont];
		set: #borderColorModifier for: #SystemWindow to: [ [:c | c adjustBrightness: -0.1] ];
		set: #borderColorModifier for: #ScrollPane to: [ [:c | c adjustBrightness: 0.1] ];
		set: #borderWidth for: #SystemWindow to: 1;
	
		set: #uniformWindowColor for: #Model to: self gray76;
				
		set: #unfocusedWindowColorModifier for: #SystemWindow to: [ [:color | color alphaMixed: 0.5 with: self gray40] ];
		set: #unfocusedLabelColor for: #SystemWindow to: self gray168;
		set: #focusedLabelColor for: #SystemWindow to: Color white;

		set: #customWindowColor for: #Browser to: ((Color r: 0.764 g: 0.9 b: 0.63) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #ChangeList to: ((Color r: 0.719 g: 0.9 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #ChangeSorter to: ((Color r: 0.719 g: 0.9 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #ChatNotes to: ((Color r: 1.0 g: 0.7 b: 0.8) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #ClassCommentVersionsBrowser to: ((Color r: 0.753 g: 0.677 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #Debugger to: ((Color r: 0.9 g: 0.719 b: 0.719) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #DualChangeSorter to: ((Color r: 0.719 g: 0.9 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #FileContentsBrowser to: ((Color r: 0.7 g: 0.7 b: 0.508) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #FileList to: ((Color r: 0.65 g: 0.65 b: 0.65) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #InstanceBrowser to: ((Color r: 0.726 g: 0.9 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #Lexicon to: ((Color r: 0.79 g: 0.9 b: 0.79) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #MCTool to: ((Color r: 0.65 g: 0.691 b: 0.876) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #MessageNames to: ((Color r: 0.639 g: 0.9 b: 0.497) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #MessageSet to: ((Color r: 0.719 g: 0.9 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #PackagePaneBrowser to: ((Color r: 0.9 g: 0.9 b: 0.63) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #PluggableFileList to: (Color lightYellow adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #PreferenceBrowser to: ((Color r: 0.671 g: 0.9 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #SMLoader to: ((Color r: 0.801 g: 0.801 b: 0.614) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #SMLoaderPlus to: ((Color r: 0.801 g: 0.801 b: 0.614) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #SMReleaseBrowser to: ((Color r: 0.801 g: 0.801 b: 0.614) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #ScriptingDomain to: ((Color r: 0.91 g: 0.91 b: 0.91) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #SelectorBrowser to: ((Color r: 0.45 g: 0.9 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #StringHolder to: ((Color r: 0.9 g: 0.9 b: 0.719) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #TestRunner to: ((Color r: 0.9 g: 0.576 b: 0.09) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #TranscriptStream to: ((Color r: 0.9 g: 0.75 b: 0.45) adjustBrightness: windowColorBrightnessAdjustment);
		set: #customWindowColor for: #VersionsBrowser to: ((Color r: 0.782 g: 0.677 b: 0.9) adjustBrightness: windowColorBrightnessAdjustment).
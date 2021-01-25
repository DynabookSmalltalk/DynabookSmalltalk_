An instance of this class is the compiler's context for filing in a SmartRefStream containing instance-specific classes.  When the old name of a new object's class conflicts with an existing class name, install a class var in me.  It has the old name but points at the new class.  The compiler uses it when compiling the code in the fileIn.  Fill the SmartRefStream's renamed class dictionary.

An object fileout:
!ObjectScanner new initialize!      "allow me to take control with scanFrom:"

Player subclass: Player23 instanceVariableNames: 'foo' classVariableNames: '' 
	poolDictionaries: nil category: 'Instance Specific'!
	"I prescan this and (self rename: #Player23 toBe: #Player30)"

!Player23 methodsFor: 'all' stamp: 'tk 3/9/98 18:58'!	"actually sent to Player30"
foo
	^ foo! !

!self smartRefStream!<binary representation of the objects>!



utilities
rename: existingName toBe: newName
	"See if there is a conflict between what the fileIn wants to call the new UniClass (Player23) and what already exists for another unique instance.  If conflict, make a class variable to intercept the existingName and direct it to class newName."

	self flag: #environments.
	existingName = newName ifFalse: [
		self class ensureClassPool.	"create the dictionary"
		"can't use addClassVarName: because it checks for conflicts with Smalltalk"
		(self class classPool includesKey: existingName) ifFalse: 
			["Pick up any refs in Undeclared"
			self class classPool declare: existingName from: Undeclared].
		self class classPool at: existingName put: (Smalltalk at: newName).
		pvt3SmartRefStrm renamed at: existingName put: newName]
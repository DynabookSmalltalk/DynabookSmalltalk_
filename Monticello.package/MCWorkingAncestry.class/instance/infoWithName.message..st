versions
infoWithName: nameString message: messageString
	^ MCVersionInfo
		name: nameString
		id: UUID new
		message: messageString
		date: Date today
		time: Time now
		author: Utilities authorInitials
		ancestors: ancestors asArray
		stepChildren: self stepChildren asArray
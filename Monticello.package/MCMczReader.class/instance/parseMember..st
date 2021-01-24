utilities
parseMember: memberOrName
	| member contents tokens |
	member := self zip member: memberOrName.
	contents := self contentsForMember: member.
	tokens := (self scanner scanTokens: contents) first.
	^ self associate: tokens
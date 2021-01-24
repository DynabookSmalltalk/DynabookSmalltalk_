actions
unload
	| empty |
	empty := categories select: [:ea |
		(SystemOrganization listAtCategoryNamed: ea) isEmpty].
	SystemOrganization categories:
		(SystemOrganization categories copyWithoutAll: empty)
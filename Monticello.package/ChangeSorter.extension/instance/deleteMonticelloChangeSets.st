*Monticello-changeSet menu
deleteMonticelloChangeSets
	"Destroy all change sets from Monticello loads, provided the currently selected change set is not one of those, and the user really wants to do this."

	myChangeSet isForPackageLoad ifTrue: "forms current changes for current project"
		[^self inform: 'current change set is a Monticello load change set.\Please select some other change set before deleting Monticello load change sets.' withCRs].
	(self confirm: 'Are you sure you want to delete all change sets due to Monticello package loads?') ifFalse:
		[^self].

	(ChangesOrganizer allChangeSets select: [:cs| cs isForPackageLoad]) do:
		[:cs| ChangesOrganizer removeChangeSet: cs].

	self changed: #changeSetList.
	self showChangeSet: ChangeSet current
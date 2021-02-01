I sort a set of passed MCDefinitions, resolving all dependency conflicts automatically.

To use me, first add some items to me using the building protocol or my class-side #items: selector. After that, send #orderedItems to me and I will tell you all items in a loadable order.

Instance Variables
	nondeferred:	<SequenceableCollection>
		Usual items that do not require special sorting mechanics.
	deferred:		<SequenceableCollection>
		Items that are added after all nondeferred items. See MCDefinition >> #wantsToBeOutermost.
	required:		<Set>
	provided:		<Set>
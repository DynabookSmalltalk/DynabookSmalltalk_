A ComposedSortFunction is an abstract class wrapping over another SortFunction for the sake of composition.

Subclasses have to define the composition behavior via collate:with: message.

Instances variables:
	baseSortFunction		<SortFunction>	the wrapped sort function
A DefaultSortFunction is a collator using the default three way compare <=> operator.
It is known to work on String and Magnitude.

It is generally not usefull to create a new instance, and the recommended pattern is to use the single instance available by sending the message SortFunction default .

For other objects  that don't understand <=> it is necessary to use a custom SortFunction rather than the default one.

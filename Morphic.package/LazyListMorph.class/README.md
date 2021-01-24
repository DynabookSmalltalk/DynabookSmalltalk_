The morph that displays the list in a PluggableListMorph.  It is "lazy" because it will only request the list items that it actually needs to display.

I will cache the maximum width of my items in maxWidth to avoid this potentially expensive and frequent computation.

The following layout properties are supported:
- #cellPositioning: #leftCenter [default], #center, #rightCenter
- #cellInset: [default: 3@0 corner: 3@0]
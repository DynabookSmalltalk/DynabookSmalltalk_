*System-Object Events-accessing-removing
removeActionsForEvent: anEventSelector

    | map |
    map := self actionMap.
    map removeKey: anEventSelector asSymbol ifAbsent: [].
    map isEmpty
        ifTrue: [self releaseActionMap]
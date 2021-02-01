accessing
transformUsing: aNamespace
^self shallowCopy instVarNamed: #name put: (aNamespace mangleClass: name);yourself
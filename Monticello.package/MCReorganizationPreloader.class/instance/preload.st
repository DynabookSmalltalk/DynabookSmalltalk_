loading
preload
	preloads ifNotEmpty: [ | loader |
		loader := MCPackageLoader new.
		(MCPatch operations: preloads) applyTo: loader.
		loader loadWithNameLike: 'mcPreload'].

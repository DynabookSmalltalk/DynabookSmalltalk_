morphic ui
viewChanges: ancestorInfo snapshot: ancestorSnapshot relativeTo: baseInfo snapshot: baseSnapshot
	"Note that the patchLabel will be parsed in MCPatchBrowser>>installSelection, so don't translate it!"
	| patch patchLabel |
	patchLabel := 'changes between {1} and {2}' format: { baseInfo name. ancestorInfo name }.
	patch := ancestorSnapshot patchRelativeToBase: baseSnapshot.
	(MCPatchBrowser forPatch: patch) label: patchLabel; show
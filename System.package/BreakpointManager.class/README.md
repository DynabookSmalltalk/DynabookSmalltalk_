This class manages methods that include breakpoints.
It has several class methods to install and uninstall breakpoints.

Evaluating "BreakpointManager clear" will remove all installed breakpoints in the system.

Known issues:
- currently, only break-on-entry type of breakpoints are supported
- emphasis change not implemented for MVC browsers
- uninstalling the breakpoint doesn't auto-update other browsers
- uninstalling a breakpoint while debugging should restart-simulate the current method

Ernest Micklei, 2002

Send comments to emicklei@philemonworks.com
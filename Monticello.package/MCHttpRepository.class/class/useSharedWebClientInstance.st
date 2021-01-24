preferences
useSharedWebClientInstance
	
	<preference: 'Use shared WebClient instance'
		category: 'Monticello'
		description: 'When true, use a shared WebClient instance to speed up downloads from MCHttpRepositories. Requires WebClient to be present.'
		type: #Boolean>
	^UseSharedWebClientInstance ifNil: [
		"The is some issue on Windows, so don't use it there by default. See http://lists.squeakfoundation.org/pipermail/squeak-dev/2019-September/thread.html#203921 for details."
		Smalltalk os platformName ~= 'Win32' ]
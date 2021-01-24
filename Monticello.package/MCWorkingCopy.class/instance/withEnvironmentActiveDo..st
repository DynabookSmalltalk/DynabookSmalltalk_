private
withEnvironmentActiveDo: aBlock
	^ self environment beCurrentDuring: aBlock
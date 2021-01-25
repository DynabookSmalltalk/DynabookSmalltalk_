power management
disablePowerManager: aInteger 
	"Disable/Enable the architectures power manager by passing in nonzero 
	or zero"
	<primitive: 'primitiveDisablePowerManager'> "primitiveExternalCall" 
	^ self
accessing
setHasNoCountersFlag
	"The Cog Sista VMs interpret bit 16 of the method header as suppressing the generation of performance counters."
	self objectAt: 1 put: (self header bitOr: 16r8000)
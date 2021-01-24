accessing
hasNoCountersFlag
	"The Cog Sista VMs interpret bit 16 of the method header as suppressing the generation of performance counters."
	^self header anyMask: 16r8000
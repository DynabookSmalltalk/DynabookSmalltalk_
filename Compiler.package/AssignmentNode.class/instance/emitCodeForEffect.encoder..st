code generation
emitCodeForEffect: stack encoder: encoder

	variable emitCodeForLoad: stack forValue: false encoder: encoder.
	value emitCodeForValue: stack encoder: encoder.
	pc := encoder nextPC. "debug pc is first byte of the store, i.e. the next byte".
	variable emitCodeForStorePop: stack encoder: encoder
code generation
emitCodeForValue: stack encoder: encoder

	variable emitCodeForLoad: stack forValue: true encoder: encoder.
	value emitCodeForValue: stack encoder: encoder.
	pc := encoder nextPC. "debug pc is first byte of the store, i.e. the next byte".
	variable emitCodeForStore: stack encoder: encoder
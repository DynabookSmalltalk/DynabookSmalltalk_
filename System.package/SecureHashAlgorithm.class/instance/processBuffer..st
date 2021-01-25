private
processBuffer: aByteArray
	"Process given 64-byte buffer, accumulating the results in totalA through totalE."

	| a b c d e t tmp w tmp2 tmp3 |
	totals ifNotNil: [ ^self processBufferUsingPrimitives: aByteArray ].

	"initialize registers a through e from the current totals" 
	a := totalA copy.
	b := totalB copy.
	c := totalC copy.
	d := totalD copy.
	e := totalE copy.

	"expand and process the buffer"
	w := self expandedBlock: aByteArray.
	tmp := ThirtyTwoBitRegister new.
	tmp2 := ThirtyTwoBitRegister new.
	tmp3 := ThirtyTwoBitRegister new.
	1 to: 80 do: [:i |
		tmp
			loadFrom: a;
			leftRotateBy: 5;
			+= (self hashFunction: i of: b with: c with: d using: tmp2 and: tmp3);
			+= e;
			+= (w at: i);
			+= (self constantForStep: i).
		t := e.
		e := d.
		d := c.
		c := b leftRotateBy: 30.
		b := a.
		a := tmp.
		tmp := t ].

	"add a through e into total accumulators"
	totalA += a.
	totalB += b.
	totalC += c.
	totalD += d.
	totalE += e.

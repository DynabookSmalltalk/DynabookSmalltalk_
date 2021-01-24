private
digitMul33: anInteger
	"Multiply after decomposing each operand in 3 parts, using a Toom-Cooke algorithm.
	Toom-Cooke is a generalization of Karatsuba divide and conquer algorithm.
	See https://en.wikipedia.org/wiki/Toom%E2%80%93Cook_multiplication
	Use a Bodrato-Zanoni variant for the choice of interpolation points and matrix inversion
	See What about Toom-Cook matrices optimality? - Marco Bodrato, Alberto Zanoni - Oct. 2006
	http://www.bodrato.it/papers/WhatAboutToomCookMatricesOptimality.pdf"
	
	| third x2 x1 x0 y2 y1 y0 y20 z4 z3 z2 z1 z0 x20 |
	"divide both operands in 3 parts, rounded to upper multiple of 4"
	third := anInteger digitLength + 11 // 12 bitShift: 2.
	x2 := self butLowestNDigits: third * 2.
	x1 := self copyDigitsFrom: third + 1 to: third * 2.
	x0 := self lowestNDigits: third.
	y2 := anInteger butLowestNDigits: third * 2.
	y1 := anInteger copyDigitsFrom: third + 1 to: third * 2.
	y0 := anInteger lowestNDigits: third.
	
	"Toom-3 trick: 5 multiplications instead of 9"
	z0 := x0 multiplyByInteger: y0.
	z4 := x2 multiplyByInteger: y2.
	x20 := x2 + x0.
	y20 := y2 + y0.
	z1 := x20 + x1 multiplyByInteger: y20 + y1.
	x20 := x20 - x1.
	y20 := y20 - y1.
	z2 := x20 multiplyByInteger: y20.
	z3 := (x20 + x2 bitShift: 1) - x0 multiplyByInteger: (y20 + y2 bitShift: 1) - y0.
	
	"Sum the parts of decomposition"
	z3 := z3 - z1 quo: 3.
	z1 := z1 - z2 bitShift: -1.
	z2 := z2 - z0.
	
	z3 := (z2 - z3 bitShift: -1) + (z4 bitShift: 1).
	z2 := z2 + z1 - z4.
	z1 := z1 - z3.
	^z0 + (z1 bitShift: 8*third) + (z2 bitShift: 16*third) + (z3 + (z4 bitShift: 8*third) bitShift: 24*third)
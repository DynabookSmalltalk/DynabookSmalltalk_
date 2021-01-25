*Graphics-KernelExtensions
sweepHandIdleProcess
	"A default background process which shows a sweeping circle of XOR-ed bits on the screen."

	| sweepHand |
	sweepHand := Pen new.
	sweepHand defaultNib: 2.
	sweepHand combinationRule: 6.
	[
		2 timesRepeat: [
			sweepHand north.
			36 timesRepeat: [
				sweepHand place: Display boundingBox topRight + (-25@25).
				sweepHand go: 20.
				sweepHand turn: 10]].
		self relinquishProcessorForMicroseconds: 10000] repeat

class initialization
initialize
	"Initialize the MIDI parameter constants."
	"MidiPrimTester initialize"

	Installed := 1.
		"Read-only. Return 1 if a MIDI driver is installed, 0 if not.
		 On OMS-based MIDI drivers, this returns 1 only if the OMS
		 system is properly installed and configured."

	Version := 2.
		"Read-only. Return the integer version number of this MIDI driver.
		 The version numbering sequence is relative to a particular driver.
		 That is, version 3 of the Macintosh MIDI driver is not necessarily
		 related to version 3 of the Win95 MIDI driver."

	HasBuffer := 3.
		"Read-only. Return 1 if this MIDI driver has a time-stamped output
		 buffer, 0 otherwise. Such a buffer allows the client to schedule
		 MIDI output packets to be sent later. This can allow more precise
		 timing, since the driver uses timer interrupts to send the data
		 at the right time even if the processor is in the midst of a
		 long-running Squeak primitive or is running some other application
		 or system task."

	HasDurs := 4.
		"Read-only. Return 1 if this MIDI driver supports an extended
		 primitive for note-playing that includes the note duration and
		 schedules both the note-on and the note-off messages in the
		 driver. Otherwise, return 0."

	CanSetClock := 5.
		"Read-only. Return 1 if this MIDI driver's clock can be set
		 via an extended primitive, 0 if not."

	CanUseSemaphore := 6.
		"Read-only. Return 1 if this MIDI driver can signal a semaphore
		 when MIDI input arrives. Otherwise, return 0. If this driver
		 supports controller caching and it is enabled, then incoming
		 controller messages will not signal the semaphore."

	EchoOn := 7.
		"Read-write. If this flag is set to a non-zero value, and if
		 the driver supports echoing, then incoming MIDI events will
		 be echoed immediately. If this driver does not support echoing,
		 then queries of this parameter will always return 0 and
		 attempts to change its value will do nothing."

	UseControllerCache := 8.
		"Read-write. If this flag is set to a non-zero value, and if
		 the driver supports a controller cache, then the driver will
		 maintain a cache of the latest value seen for each MIDI controller,
		 and control update messages will be filtered out of the incoming
		 MIDI stream. An extended MIDI primitive allows the client to
		 poll the driver for the current value of each controller. If
		 this driver does not support a controller cache, then queries
		 of this parameter will always return 0 and attempts to change
		 its value will do nothing."

	EventsAvailable := 9.
		"Read-only. Return the number of MIDI packets in the input queue."

	FlushDriver := 10.
		"Write-only. Setting this parameter to any value forces the driver
		 to flush its I/0 buffer, discarding all unprocessed data. Reading
		 this parameter returns 0. Setting this parameter will do nothing
		 if the driver does not support buffer flushing."

	ClockTicksPerSec := 11.
		"Read-only. Return the MIDI clock rate in ticks per second."

	HasInputClock := 12.
		"Read-only. Return 1 if this MIDI driver timestamps incoming
		 MIDI data with the current value of the MIDI clock, 0 otherwise.
		 If the driver does not support such timestamping, then the
		 client must read input data frequently and provide its own
		 timestamping."

This class simply demonstrates and tests the MIDI primitives. MIDI applications should use Stephen Pope's MIDIPort class, which will replace this one.

The Macintosh, and perhaps some other platforms, can send and receive MIDI data over a serial port by using an external clock signal supplied by an external MIDI adapter to generate the correct MIDI baud rate. Typical clock speeds of such adapters are 1, 2, or 0.5 MHz. This clock speed can be specified when a MIDI port is opened. On other platforms, this clock speed parameter is ignored.

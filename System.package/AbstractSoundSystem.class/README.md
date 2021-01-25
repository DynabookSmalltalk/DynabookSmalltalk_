This is the abstract base class for a sound system. A sound system offers a small protocol for playing sounds and making beeps and works like a facade towards the rest of Squeak. A sound system is registered in the application registry SoundService and can be accessed by "SoundService default" like for example:

SoundService default playSoundNamed: 'croak'

The idea is that as much sound playing as possible should go through this facade. This way we decouple the sound system from the rest of Squeak and make it pluggable. It also is a perfect spot to check for the Preference class>>soundsEnabled.

Two basic subclasses exist at the time of this writing, the BaseSoundSystem which represents the standard Squeak sound system, and the DummySoundSystem which is a dummy implementation that can be used when there is no sound card available, or when the base sound system isn't in the image, or when you simply don't want to use the available sound card.
decompiling
decompileWithTemps
	"Answer the decompiled parse tree that represents self, but with the temp names obtained
	 either by compiling the source code, or directly if the method has temps in its trailer."

	^self homeMethod decompileWithTemps
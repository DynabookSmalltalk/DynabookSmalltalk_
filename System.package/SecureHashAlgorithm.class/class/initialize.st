class initialization
initialize
	"SecureHashAlgorithm initialize"
	"For the curious, here's where these constants come from:
	  #(2 3 5 10) collect: [:x | ((x sqrt / 4.0) * (2.0 raisedTo: 32)) truncated hex]"

	K1 := ThirtyTwoBitRegister fromInteger: 16r5A827999.
	K2 := ThirtyTwoBitRegister fromInteger: 16r6ED9EBA1.
	K3 := ThirtyTwoBitRegister fromInteger: 16r8F1BBCDC.
	K4 := ThirtyTwoBitRegister fromInteger: 16rCA62C1D6.
	
	TA := ThirtyTwoBitRegister fromInteger: 16r67452301.
	TB := ThirtyTwoBitRegister fromInteger: 16rEFCDAB89.
	TC := ThirtyTwoBitRegister fromInteger: 16r98BADCFE.
	TD := ThirtyTwoBitRegister fromInteger: 16r10325476.
	TE := ThirtyTwoBitRegister fromInteger: 16rC3D2E1F0.
	(TI := Bitmap new: 5)
		at: 1 put: 16r67452301;	
		at: 2 put: 16rEFCDAB89;
		at: 3 put: 16r98BADCFE;
		at: 4 put: 16r10325476;
		at: 5 put: 16rC3D2E1F0
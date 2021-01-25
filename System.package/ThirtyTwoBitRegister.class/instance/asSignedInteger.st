converting
asSignedInteger
	"Answer the signed integer value of my current contents."

	hi >= 16r8000 ifFalse: [ ^(hi bitShift: 16) + low ].
	^-1 - (low bitXor: 16rFFFF) - ((hi bitXor: 16rFFFF) bitShift: 16)



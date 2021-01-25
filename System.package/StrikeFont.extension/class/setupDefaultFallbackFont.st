*System-Fonts
setupDefaultFallbackFont
"
	StrikeFont setupDefaultFallbackFont
"

	(#(#Accuat #Accujen #Accula #Accumon #Accusf #Accushi #Accuve #Atlanta) collect: [:e | TextStyle named: e]) do: [:style |
		style fontArray do: [:e |
			e reset.
			e setupDefaultFallbackFont.
		].
	].
	TTCFont allSubInstances
		do: [:font | font reset.
			font setupDefaultFallbackFont]


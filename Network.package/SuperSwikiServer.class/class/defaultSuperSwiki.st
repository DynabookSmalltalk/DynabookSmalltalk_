instances
defaultSuperSwiki

	^SuperSwikiServer new 
		type: #http;
		server: self defaultSuperSwikiIPAddress;
		directory: '/super/SuperSwikiProj'
	

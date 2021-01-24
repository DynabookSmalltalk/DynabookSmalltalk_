converting
asOctetString
	"Convert the receiver into an octet string if possible. The resulting string will contain 
	only bytes if all characters fit into bytes. If there is any character > 255 the resulting
	string will be a WideString instead."
	| string |
	string := String new: self size.
	1 to: self size do: [:i | string at: i put: (self at: i)].
	^string
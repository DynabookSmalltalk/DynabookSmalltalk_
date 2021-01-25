rules
application =

	"^" name:rule args:as				-> [{#SuperApp. rule}, as]
|	name:grm $. nsName:rule args:as	-> [{#App. #foreign. grm. ('#', rule) asSymbol}, as]
|	name:rule args:as						-> [{#App. rule}, as]
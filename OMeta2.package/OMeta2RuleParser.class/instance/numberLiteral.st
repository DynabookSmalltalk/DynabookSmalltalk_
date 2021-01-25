rules
numberLiteral =

	spaces ($- spaces -> [-1] | empty -> [1]):sign digit+:ds
		-> [{#App. #exactly. (sign * (String withAll: ds) asNumber) storeString}]
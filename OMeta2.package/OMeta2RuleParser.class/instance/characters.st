rules
characters =

	"``" (~($' $') char)*:xs $' $' -> [{#App. #seq. (String withAll: xs) storeString}]
rules
tokenSugar =

	token('"') (~$" char)*:xs $" -> [{#App. #token. (String withAll: xs) storeString}]
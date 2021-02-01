private
setUniformDelay: anInteger
      "set delay to a uniform value for all images"
	delays := Array new: images size withAll: anInteger.
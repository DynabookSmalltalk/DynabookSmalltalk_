accessing
isProtected: o
^o == self or: [o == objects] or: [o == basicObjects and: [basicObjects notNil]] or: [o == objects instVarNamed: #array] or: [o == self class]
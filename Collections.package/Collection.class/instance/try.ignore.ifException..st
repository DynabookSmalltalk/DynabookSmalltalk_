enumerating
try: aBlock ignore: exceptionOrExceptionSet ifException: unaryBlockOrNil
      "Evaluate aBlock with each of the receiver's elements as the argument. On error, evaluate a block and/or continue."

      ^ self do: [:ea |
              [aBlock value: ea]
                      on: exceptionOrExceptionSet
                      do: [:err | unaryBlockOrNil ifNotNil: [unaryBlockOrNil value: err]]]
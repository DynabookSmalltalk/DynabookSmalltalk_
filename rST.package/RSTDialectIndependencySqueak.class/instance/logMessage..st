logging
logMessage: aBlock 
	
			loggingMutex
				critical: [| message | 
					self flag: #TODO.
					"log to a file"
					message _ String new writeStream.
					message
						nextPutAll: (Date today printFormat: #(3 2 1 $- 1 1 2 ));
						 space;
						 nextPutAll: Time now print24;
						 nextPut: $:;
						 space;
						 nextPutAll: aBlock value asString.
					Transcript show: message contents;
						 cr]
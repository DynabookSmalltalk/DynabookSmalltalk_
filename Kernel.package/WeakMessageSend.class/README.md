Instances of WeakMessageSend encapsulate message sends to objects, like MessageSend. Unlike MessageSend it is not necessarily a valid message.  A request to value only results in a send if in fact it is valid. 

See MessageSendComments also. WeakMessageSend is used primarily for event registration. 

Unlike MessageSend WeakMessageSend stores receiver (object receiving the message send) as the first and only element of its array as opposed to a named ivar.
But like MessageSend, it does have
 selector		Symbol -- message selector
 arguments		Array -- bound arguments
and it also has
 shouldBeNil	Array of Booleans --  used to track valid nil values in arguments array
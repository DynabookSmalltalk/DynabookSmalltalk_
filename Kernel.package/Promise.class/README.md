I represent the result of an asynchronous message.  Once the message is processed, I will be resolved to a value.  I am typically instantiated by invocations of #futureSend:at:args: (and not by #futureDo:atArgs:).

See class-comment of FutureNode.

I also implement the Promises/A+ Javascript specification. This allows you to chain my instances to perform arbitrarily complex asynchronous tasks with error handling baked in.

A Promise may be in one of three possible states: #pending, #fulfilled or #rejected. A Promise may move from #pending -> #fulfilled (by way of the resolveWith: message), or from #pending -> #rejected (by way of rejectWith:). No other state changes may occur.

Once #fulfilled or #rejected, a Promise's value must not change. In keeping with the major Javascript Promise implementations' interpretations of this, calls to resolveWith: or rejectWith: when a Promise is in #fulfilled or #rejected state are simply ignored - an error is not signalled. (See test cases PromiseTest testFirstResolutionWins, testCannotRejectFulfilledPromise and testCannotResolveaRejectedPromise.)
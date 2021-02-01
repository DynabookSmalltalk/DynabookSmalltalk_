accessing
runContainer: theBlock
| s1 s2 a v procs px |
a := objects associations asArray.
s1 := Semaphore new. s2 := Semaphore new.
procs := OrderedCollection new.
[procs add: Processor activeProcess. s1 wait. [v := theBlock value] ensure: [s2 signal]] fork.
procs add: Processor activeProcess.
(px := Process allInstances reject: [:x|procs includes: x]) do: #suspend.
 (a collect: #key) asArray elementsExchangeIdentityWith: (a collect: #value) asArray.
s1 signal. s2 wait.
(a collect: #key) asArray elementsExchangeIdentityWith: (a collect: #value) asArray.
px do: #resume.
^v
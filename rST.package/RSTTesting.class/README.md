To test rST you need to run 2 squeaks in the same machine or in diferents machines.

If you run this examples in diferent machines, don't forget to change the IP address of the "server" squeak in RSTTesting class>>runClient

In server squeak:
	RSTTesting serverStartup.

In client squeak:
	RSTTesting runClient.

After run, in both squeaks:
	RSTTesting cleanup.

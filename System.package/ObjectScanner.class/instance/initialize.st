initialize-release
initialize
	"remove all old class vars that are not instance-specific classes being renamed"

	self clear.
	"Most importantly, return self, so a fileIn will let ObjectScanner seize control.  So UniClasses can be remapped.  See the transfer of control where ReadWriteStream fileIn calls scanFrom:"
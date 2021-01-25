events
wantsEvent: evt
	"evt is a raw event buffer from VM. check if its window field matches ours"
	^ windowHandle = (evt at: 8)
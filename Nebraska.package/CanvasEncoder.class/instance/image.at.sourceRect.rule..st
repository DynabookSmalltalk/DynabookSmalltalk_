drawing
image: aForm at: aPoint sourceRect: sourceRect rule: argRule

	| cacheID cacheNew cacheReply formToSend cacheEntry destRect visRect aFormArea d2 rule |

	rule := argRule.

	"first if we are only going to be able to draw a small part of the form,
	it may be faster just to send the part of the form that will actually show up"

	destRect := aPoint extent: sourceRect extent.
	d2 := (lastTransform invertBoundsRect: destRect) expandBy: 1.
	(d2 intersects: lastClipRect) ifFalse: [
		^NebraskaDebug at: #bigImageSkipped add: {lastClipRect. d2}.
	].
	aFormArea := aForm boundingBox area.
	(aFormArea > 20000 and: [aForm isStatic not and: [lastTransform isPureTranslation]]) ifTrue: [
		visRect := destRect intersect: lastClipRect.
		visRect area < (aFormArea // 20) ifTrue: [
			"NebraskaDebug 
				at: #bigImageReduced 
				add: {lastClipRect. aPoint. sourceRect extent. lastTransform}."
			formToSend := aForm copy: (visRect translateBy: sourceRect origin - aPoint).
			formToSend depth = 32 ifTrue: [
				formToSend := formToSend asFormOfDepth: 16.
				(rule = 24 or: [rule = 34]) ifTrue: [rule := 25]].
			^self 
				image: formToSend 
				at: visRect origin 
				sourceRect: formToSend boundingBox
				rule: rule
				cacheID: 0 		"no point in trying to cache this - it's a one-timer"
				newToCache: false.
		].
	].

	cacheID := 0.
	cacheNew := false.
	formToSend := aForm.
	(aFormArea > 1000 and: [(cacheReply := self testCache: aForm) notNil]) ifTrue: [
		cacheID := cacheReply first.
		cacheEntry := cacheReply third.
		(cacheNew := cacheReply second) ifFalse: [
			formToSend := aForm isStatic 
				ifTrue: [nil] 
				ifFalse: [aForm depth <= 8 ifTrue: [aForm] ifFalse: [aForm deltaFrom: cacheEntry fourth]].
		].
		cacheEntry at: 4 put: (aForm isStatic ifTrue: [aForm] ifFalse: [aForm deepCopy]).
	].
	(formToSend notNil and: [
		formToSend depth = 32 and: [
			rule ~= 24 and: [
				rule ~= 34]]]) ifTrue: [
		formToSend := formToSend asFormOfDepth: 16.
	].
	self
		image: formToSend 
		at: aPoint 
		sourceRect: sourceRect 
		rule: rule 
		cacheID: cacheID 
		newToCache: cacheNew.


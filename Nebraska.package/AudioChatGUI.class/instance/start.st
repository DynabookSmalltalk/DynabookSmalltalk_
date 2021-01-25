stepping and presenter
start

	| myUpdatingText playButton myOpenConnectionButton myStopButton window  |
"
--- old system window version ---
"
	Socket initializeNetwork.
	myrecorder initialize.

	window := (SystemWindow labelled: 'iSCREAM') model: self.

	myalert := AlertMorph new.
	myalert socketOwner: self.
	window addMorph: myalert frame: (0.35@0.4 corner: 0.5@0.7).

	(playButton := self playButton) center: 200@300.
	window addMorph: playButton frame: (0.5@0.4 corner: 1.0@0.7).

	(myOpenConnectionButton := self connectButton) center: 250@300.
	window addMorph: myOpenConnectionButton frame: (0.5@0 corner: 1.0@0.4).

	(myStopButton := self recordAndStopButton) center: 300@300.
	window addMorph: myStopButton frame: (0.5@0.7 corner: 1.0@1.0).

	myUpdatingText := UpdatingStringMorph on: self selector: #objectsInQueue.
	window addMorph: myUpdatingText frame: (0.41@0.75 corner: 0.45@0.95).

	"myUserList init."
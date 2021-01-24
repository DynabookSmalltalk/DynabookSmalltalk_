accessing
environment: anEnvironment
	"Anything that is loaded to me should go into anEnvironment from now on."
	environment := anEnvironment.
	package := package inEnvironment: anEnvironment.
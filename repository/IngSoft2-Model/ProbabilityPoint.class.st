"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Vincula un evento con la posibilidad de que este suceda
"
Class {
	#name : #ProbabilityPoint,
	#superclass : #Object,
	#instVars : [
		'event',
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertion }
ProbabilityPoint class >> assertValid: aProbability [
		(aProbability < 0) ifTrue: [ 
		Error signal: 'A probabilty can not be negative' ]
]

{ #category : #'class initialization' }
ProbabilityPoint class >> initializeEvent: anObject withProbability: aProbability [
	self assertValid: aProbability.
	^ self new initializeEvent: anObject withProbability: aProbability
]

{ #category : #initialization }
ProbabilityPoint >> event [

^event.
]

{ #category : #initialization }
ProbabilityPoint >> initializeEvent: anObject withProbability: aProbability [

	event := anObject.
	probability := aProbability
]

{ #category : #initialization }
ProbabilityPoint >> probability [

	^ probability 
]

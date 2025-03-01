"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Genera un objetos al azar a partir de un conjunto de objetos ProbabilityPoint
"
Class {
	#name : #ProbabilityDistribution,
	#superclass : #Object,
	#instVars : [
		'points'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertion }
ProbabilityDistribution class >> assertValid: points [

	| sum |
	points size <= 0 ifTrue: [ Error signal: 'There must be at least one point' ].
	
	sum := points sum: [ :point | point probability  ].
	sum == 100 ifFalse: [ 
		Error signal: 'The sum of the probabilities must be 100%' ].
]

{ #category : #'class initialization' }
ProbabilityDistribution class >> with: aCollectionOfPoints [

	| indices probabilities |
	indices := OrderedCollection new.
	probabilities := OrderedCollection new.
	aCollectionOfPoints do: [ :aPoint | 
		indices add: aPoint event.
		probabilities add: aPoint probability  ].
	self assertValid: aCollectionOfPoints.
	^ self new with: aCollectionOfPoints
]

{ #category : #generating }
ProbabilityDistribution >> generateRandom [

	| result |
	result := 100 atRandom.
	^ self getGeneratedObjectWith: result
]

{ #category : #generating }
ProbabilityDistribution >> getGeneratedObjectWith: result [

	| prob sum |
	sum := 0.
	points do: [ :aPoint | 
		prob := aPoint probability .
		result <= (prob + sum)
			ifTrue: [ ^ aPoint event ]
			ifFalse: [ sum := sum + prob ] ]
]

{ #category : #initialization }
ProbabilityDistribution >> with: aCollectionOfPoints [ 
	points:= aCollectionOfPoints.
]

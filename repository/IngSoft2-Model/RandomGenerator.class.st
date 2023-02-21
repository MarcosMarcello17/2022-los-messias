"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Genera una cantidad de objetos a partir de una ProbabilityDistribution
"
Class {
	#name : #RandomGenerator,
	#superclass : #Object,
	#instVars : [
		'probabilityDistribution'
	],
	#classInstVars : [
		'parsecsBoard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RandomGenerator class >> distributedBy: probabilityDistribution [

	^ self new initializeWith: probabilityDistribution
]

{ #category : #generating }
RandomGenerator >> generate [

	^ probabilityDistribution generateRandom deepCopy
]

{ #category : #generating }
RandomGenerator >> generateRandomObjectsWith: numberOfObjects [

	| objectsGenerated |
	objectsGenerated := OrderedCollection new.
	1 to: numberOfObjects do: [ :number | 
	objectsGenerated add: self generate ].
	^ objectsGenerated
]

{ #category : #initialization }
RandomGenerator >> initializeWith:aProbabilityDistribution [

	probabilityDistribution := aProbabilityDistribution
]

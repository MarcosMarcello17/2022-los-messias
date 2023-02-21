"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- Implementada para almacenar las cartas tiradas en el juego
"
Class {
	#name : #ActiveCard,
	#superclass : #Object,
	#instVars : [
		'card',
		'ship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
ActiveCard class >> with: card appliedTo: ship [

	^ self new initializeWith: card appliedTo: ship
]

{ #category : #comparing }
ActiveCard >> = activeCard [

	^ self ship = activeCard ship and: [ 
		  self card class = activeCard card class ]
]

{ #category : #accessing }
ActiveCard >> card [
	^ card
]

{ #category : #accessing }
ActiveCard >> changeOfRoll [ 

^card changeOfRoll.
]

{ #category : #initialization }
ActiveCard >> initializeWith: aCard appliedTo: aShip [
	card := aCard.
	ship := aShip 
]

{ #category : #accessing }
ActiveCard >> ship [
	^ ship
]

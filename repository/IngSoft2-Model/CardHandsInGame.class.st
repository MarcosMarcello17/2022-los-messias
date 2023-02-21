"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Vincula la mano de cartas de cada jugador con el juego
"
Class {
	#name : #CardHandsInGame,
	#superclass : #Object,
	#instVars : [
		'cardHands'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
CardHandsInGame class >> with: aCollectionOfShips [
	^self new initializeWith: aCollectionOfShips.
]

{ #category : #accessing }
CardHandsInGame >> cardHandOf: aShip [ 
	^ (cardHands select: [ :aCardHand | aCardHand ship = aShip ]) first
]

{ #category : #actions }
CardHandsInGame >> giveCard: aCard to: aShip [ 
	| cardHand |
	cardHand:= ((cardHands select: [ :aCardHand | aCardHand ship  == aShip ] )first) .
	cardHand add: aCard.
]

{ #category : #initialization }
CardHandsInGame >> initializeWith: aCollectionOfShips [

	cardHands := OrderedCollection new.
	aCollectionOfShips do: [ :aShip | 
		cardHands add: (CardHand of: aShip )].
]

"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Vincula al jugador con su mano de cartas actual
"
Class {
	#name : #CardHand,
	#superclass : #Object,
	#instVars : [
		'handOfCards',
		'ship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
CardHand class >> of: aShip [ 
	^self new initializeCardHandOf: aShip with: {  }.
]

{ #category : #private }
CardHand >> add: aCard [
	handOfCards add: aCard.
]

{ #category : #asserting }
CardHand >> assertCardIsInHand: aCard [

	(handOfCards anySatisfy: [ :card | aCard = card ]) 
		ifFalse: [ Error signal: 'Card is not in Hand' ]
]

{ #category : #initalization }
CardHand >> initializeCardHandOf: aShip with: cards [ 
	handOfCards := cards asOrderedCollection.
	ship:= aShip
]

{ #category : #private }
CardHand >> remove: aCard [

	| cards |
	cards := handOfCards select: [ :card | card = aCard ].
	handOfCards remove: cards first
]

{ #category : #accessing }
CardHand >> ship [
	^ ship
]

{ #category : #accessing }
CardHand >> sizeOfCardHand [
	^(handOfCards size)
]

{ #category : #throwing }
CardHand >> throw: aCancelationCard removingToAll: aCard on: aZathuraGame [

	aCancelationCard
		applyEffectTo: aZathuraGame  ships
		removing: aCard
		on: aZathuraGame .
	self remove: aCancelationCard
]

{ #category : #throwing }
CardHand >> throw: aCard to: aTarget on: aZathuraGame [

	self assertCardIsInHand: aCard.
	aCard applyEffectTo: aTarget on: aZathuraGame by: self ship.
	self remove: aCard
]

{ #category : #throwing }
CardHand >> throw: cancellationCard to: aTarget removing: aCard on: aZathuraGame [

	cancellationCard
		applyEffectTo: { aTarget }
		removing: aCard
		on: aZathuraGame.
	self remove: cancellationCard
]

{ #category : #throwing }
CardHand >> throw: card toAllShipsOn: aZathuraGame [

	self assertCardIsInHand: card.
	card applyEffectToAllShipsOn: aZathuraGame by: self ship.
	self remove: card
]

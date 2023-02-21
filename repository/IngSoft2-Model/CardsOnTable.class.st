"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Encargada del control de las cartas que fueron aplicadas dentro del juego
"
Class {
	#name : #CardsOnTable,
	#superclass : #Object,
	#instVars : [
		'cardsOnTable',
		'thrownCardsStack'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
CardsOnTable class >> initalizeNew [

	^ self new initalizeNew .
]

{ #category : #private }
CardsOnTable >> addCardToTable: aCard [ 
	cardsOnTable add: aCard.
	self addToTheCardsStack: aCard card
]

{ #category : #private }
CardsOnTable >> addToTheCardsStack: aCard [ 
	thrownCardsStack add: aCard.
]

{ #category : #asserting }
CardsOnTable >> assertCardHasBeenThrown [
		thrownCardsStack ifEmpty: [ 
		Error signal:
			'Redo card must be thrown before another card has been played' ]
]

{ #category : #asserting }
CardsOnTable >> assertIsOnTable: aCard [ 
		aCard ifEmpty: [ 
		Error signal: 'This card is not active in the table' ]
]

{ #category : #accessing }
CardsOnTable >> cardsAffecting: aShip [

	^cardsOnTable select: [ :aCard | aCard ship includes: aShip ]
]

{ #category : #accessing }
CardsOnTable >> findCardOnTable: aCard [ 
		| theCard |
	theCard := cardsOnTable select: [ :card | card = aCard ].
	self assertIsOnTable: theCard.
	^ theCard first
]

{ #category : #initialization }
CardsOnTable >> initalizeNew [

	cardsOnTable := OrderedCollection new.
	thrownCardsStack := OrderedCollection new.
]

{ #category : #accessing }
CardsOnTable >> lastCardThrownOnTheGame [
	self assertCardHasBeenThrown.
	^ thrownCardsStack last
]

{ #category : #private }
CardsOnTable >> remove: aCard [ 
	cardsOnTable remove: aCard.
	aCard removeEffect.
]

{ #category : #accessing }
CardsOnTable >> rollChangeOf: aShip [ 
	^(self cardsAffecting: aShip) sum: [ :aCard |  aCard changeOfRoll ].
]

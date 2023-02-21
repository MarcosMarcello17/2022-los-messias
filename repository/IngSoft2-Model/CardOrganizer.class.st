"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Implementada para encargarse de la logica de las cartas dentro del juego
"
Class {
	#name : #CardOrganizer,
	#superclass : #Object,
	#instVars : [
		'deck',
		'cardsOnTable',
		'thrownCardsStack',
		'zathuraGame'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CardOrganizer class >> with: aCollectionOfShips and: aCollectionOfCards from: aZathuraGame [

	^ self new
		  initializeWith: aCollectionOfShips
		  and: aCollectionOfCards
		  from: aZathuraGame 
]

{ #category : #private }
CardOrganizer >> addCardToTable: aCard [

cardsOnTable addCardToTable: aCard.

]

{ #category : #private }
CardOrganizer >> addTheNextCardToHandCardOf: aShip [

	zathuraGame giveCardTo: aShip
]

{ #category : #private }
CardOrganizer >> addToTheCardsStack: aCard [ 
	cardsOnTable addToTheCardsStack: aCard.
]

{ #category : #accessing }
CardOrganizer >> findChangeOfRoll: aShip [

	^ cardsOnTable rollChangeOf: aShip
]

{ #category : #accessing }
CardOrganizer >> getNumberOfCardsOf: aShip [ 
	^zathuraGame getNumberOfCardsOf: aShip.
]

{ #category : #private }
CardOrganizer >> giveCard [

	^ deck next
]

{ #category : #initialization }
CardOrganizer >> initializeWith: aCollectionOfShips and: aCollectionOfCards from: aZathuraGame [

	deck := aCollectionOfCards asOrderedCollection asSequence.
	cardsOnTable := CardsOnTable initalizeNew.
	thrownCardsStack := OrderedCollection new.
	zathuraGame := aZathuraGame .
]

{ #category : #accessing }
CardOrganizer >> lastCardThrownOnTheGame [

^cardsOnTable lastCardThrownOnTheGame .
]

{ #category : #private }
CardOrganizer >> removeFromCardsOnTable: aCard with: aCancellationCard [

	| theCard |
	theCard := cardsOnTable  findCardOnTable: aCard.
	cardsOnTable remove: theCard.
	cardsOnTable  addToTheCardsStack: aCancellationCard .
]

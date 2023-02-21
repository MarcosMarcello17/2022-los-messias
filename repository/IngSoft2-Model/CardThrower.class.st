"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Implementada para manejar la logica del tirado de cartas en el juego
"
Class {
	#name : #CardThrower,
	#superclass : #Object,
	#instVars : [
		'cardHands',
		'zathura'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
CardThrower class >> createNewWith: cardHands in: aZathuraGame [

	^ self new createNewWith: cardHands in: aZathuraGame .
]

{ #category : #intialization }
CardThrower >> createNewWith: aGroupOfCardHands in: aZathuraGame [ 
		cardHands := aGroupOfCardHands.
	zathura := aZathuraGame.
]

{ #category : #throwing }
CardThrower >> throw: aCancellationCard to: destinationShip removing: aCard from: sourceShip [ 
	(cardHands cardHandOf: sourceShip)
		throw: aCancellationCard
		to: destinationShip
		removing: aCard
		on: zathura .
]

{ #category : #throwing }
CardThrower >> throw: anAccelerationCard toAllShipsFrom: aShip [

	(cardHands cardHandOf: aShip)
		throw: anAccelerationCard
		toAllShipsOn: zathura
]

{ #category : #throwing }
CardThrower >> throws: aCancellationCard removing: aCard from: sourceShip [ 
	(cardHands cardHandOf: sourceShip)
		throw: aCancellationCard
		removingToAll: aCard
		on: zathura 
]

{ #category : #throwing }
CardThrower >> throws: aCard to: destinationShip from: sourceShip [

	(cardHands cardHandOf: sourceShip)
		throw: aCard
		to: destinationShip
		on: zathura
]

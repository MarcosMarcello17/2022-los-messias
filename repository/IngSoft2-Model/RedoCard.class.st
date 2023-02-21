"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

● Tiene el mismo efecto que la última carta que se jugó.
● Si la carta indica que hay que elegir una nave/ carta, no tiene por qué ser el mismo.
● Si la última carta jugada es un REDO, se toma la carta que aplicó efecto debido a ese REDO.

"
Class {
	#name : #RedoCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
RedoCard >> = aCard [

^(self class == aCard class).
]

{ #category : #private }
RedoCard >> applyEffectTo: aTarget on: aZathuraGame by: sourceShip [

	(self lastCardThrownIn: aZathuraGame)
		applyEffectTo: aTarget
		on: aZathuraGame
		by: sourceShip
]

{ #category : #private }
RedoCard >> applyEffectTo: aShip removing: card on: aZathuraGame [

	(self lastCardThrownIn: aZathuraGame )applyEffectTo: aShip removing: card on: aZathuraGame
]

{ #category : #private }
RedoCard >> applyEffectToAllShipsOn: zathura by: sourceShip [

	(self lastCardThrownIn: zathura)applyEffectToAllShipsOn: zathura by: sourceShip
]

{ #category : #accessing }
RedoCard >> lastCardThrownIn: aZathuraGame [ 
	^aZathuraGame lastCardThrownOnTheGame.
]

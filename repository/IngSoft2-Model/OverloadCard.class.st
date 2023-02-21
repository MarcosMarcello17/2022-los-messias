"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

● Reduce en 2 la tirada total de una nave a elección
● Afecta la tirada total, no a cada dado individual
● Si el resultado es negativo, retrocede
"
Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
OverloadCard >> = aCard [

^(self class == aCard class).
]

{ #category : #private }
OverloadCard >> applyEffectTo: aTarget on: aZathuraGame by: sourceShip [

	self assertIsYourTurn: sourceShip in: aZathuraGame.
	aZathuraGame addCardToTable:
		(ActiveCard with: self appliedTo: { aTarget })
]

{ #category : #asserting }
OverloadCard >> assertIsYourTurn: aShip in: aZathuraGame [

	(aZathuraGame isTurnOf: aShip) ifFalse: [ 
		Error signal: 'Permanent cards can only be used when its your turn' ]
]

{ #category : #accessing }
OverloadCard >> changeOfRoll [
	^-2
]

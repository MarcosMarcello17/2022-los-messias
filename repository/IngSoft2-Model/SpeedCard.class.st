"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

 Incrementa en 1 la tirada total de una nave a elección.
● Afecta la tirada total, no cada dado individual

"
Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
SpeedCard >> = aCard [

^(self class == aCard class)
]

{ #category : #private }
SpeedCard >> applyEffectTo: ship on: aZathuraGame by: sourceShip [

	self assertIsYourTurn: sourceShip in: aZathuraGame.
	aZathuraGame addCardToTable:
		(ActiveCard with: self appliedTo: { ship })
]

{ #category : #asserting }
SpeedCard >> assertIsYourTurn: aShip in: aZathuraGame [

	(aZathuraGame isTurnOf: aShip) ifFalse: [ 
		Error signal: 'Permanent cards can only be used when its your turn' ]
]

{ #category : #accessing }
SpeedCard >> changeOfRoll [
	^1
]

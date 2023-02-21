"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

CANCELACIÓN (CANCELLATION)
● Carta Instantánea
● Remueve del juego una carta permanente activa.
● La carta se elige, no es al azar.
● No se puede jugar esta carta si no hay cartas permanentes en efecto.
"
Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
CancellationCard >> = aCard [

^(self class == aCard class).
]

{ #category : #private }
CancellationCard >> applyEffectTo: aShip removing: aCard on: aZathuraGame [

	aZathuraGame
		removeFromCardsOnTable: (ActiveCard with: aCard appliedTo: aShip)
		with: self
]

"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

 Aplica nuevamente el último efecto aplicado en el juego (no importa quién lo haya disparado), pero se
debe elegir a qué nave se le aplica ese efecto.
● Si el casillero no tiene efecto, entonces esta carta no tiene efecto.
● Si nadie tiró los dados, entonces esta carta no tiene efecto.

"
Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
RepeatCard >> = aCard [

^(self class == aCard class).
]

{ #category : #private }
RepeatCard >> applyEffectTo: aTarget on: aZathuraGame by: sourceShip [

	aZathuraGame applyLastEffectOn: aTarget with: self
]

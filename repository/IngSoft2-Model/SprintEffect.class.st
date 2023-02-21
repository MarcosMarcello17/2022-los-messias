"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Hace avanzar a la nave tantos casilleros como cartas tenga en mano la nave
"
Class {
	#name : #SprintEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
SprintEffect >> applyFor: aShip on: aBoard [

	reverse not ifTrue: [ aBoard moveByNumberOfCards: aShip ] ifFalse: [aBoard moveAllByNumberOfCardsExcept: aShip].
]

Class {
	#name : #SprintEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
SprintEffect >> applyFor: aShip on: aBoard [

	reverse not ifTrue: [ aBoard moveByNumberOfCards: aShip ] ifFalse: [aBoard moveAllByNumberOfCardsExcept: aShip].
]

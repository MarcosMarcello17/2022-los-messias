Class {
	#name : #SprintEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
SprintEffect >> applyFor: aShip on: aBoard [

	aBoard moveByNumberOfCards: aShip.
]

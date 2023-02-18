Class {
	#name : #ReversePolarityCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
ReversePolarityCard class >> to: anEffect [ 
	^self new to: anEffect .
]

{ #category : #comparing }
ReversePolarityCard >> = aCard [

^(self class == aCard class).
]

{ #category : #actions }
ReversePolarityCard >> applyEffectTo: anEffect on: aZathuraGame by: aShip [ 
	aZathuraGame reverseEffectOf: anEffect .
]

{ #category : #initialization }
ReversePolarityCard >> to: anEffect [ 
	effect := anEffect .
]

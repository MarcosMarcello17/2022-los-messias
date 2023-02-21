"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Guarda un valor en LightYear para que sea mas facil generar la conversion a otra unidad de medida
"
Class {
	#name : #LightYear,
	#superclass : #UnitMeasure,
	#instVars : [
		'lightYears'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LightYear class >> with: aNumber [
	^ self new initializeWith: aNumber
]

{ #category : #initialization }
LightYear >> initializeWith: lightYear [

	lightYears := lightYear
]

{ #category : #evaluating }
LightYear >> value [

	^lightYears 
]

{ #category : #converting }
LightYear >> valueAsParsec [

	^ lightYears // 3
]

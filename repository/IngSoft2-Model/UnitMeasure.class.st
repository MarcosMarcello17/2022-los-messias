"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Guarda un valor en una medida para que sea facilmente convertible
"
Class {
	#name : #UnitMeasure,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
UnitMeasure >> initializeWith: value [ 
	self subclassResponsibility
]

{ #category : #evaluating }
UnitMeasure >> value [

self subclassResponsibility .
]

{ #category : #converting }
UnitMeasure >> valueAsParsec [

	self subclassResponsibility
]

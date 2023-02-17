Class {
	#name : #UnitMeasure,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
UnitMeasure >> initializeWith: value [ 
	self subclassResponsibility
]

{ #category : #evaluating }
UnitMeasure >> value [

self subclassResponsibility .
]

{ #category : #accessing }
UnitMeasure >> valueAsParsec [

	self subclassResponsibility
]

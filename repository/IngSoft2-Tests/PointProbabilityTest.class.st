Class {
	#name : #PointProbabilityTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PointProbabilityTest >> testPointProbabilityThrowsErrorWhenItIsLoadedWithANegativeProbability [

	self
		should: [ 
		ProbabilityPoint initializeEvent: 'c' withProbability: -10 ]
		raiseErrorWithMessage: 'A probabilty can not be negative'
]

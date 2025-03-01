Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'tests  - DiceCup' }
DiceTest >> testDiceCupRollResultIsTheSumOfTheResultsOfEachIndividualDie [

	| aDiceCup rollResult |
	aDiceCup := DiceCup withAll: { 
			            (LoadedDie with: 4).
			            (LoadedDie with: 7).
			            (LoadedDie with: 2) }.
	rollResult := aDiceCup roll.
	self assert: rollResult equals: 13
]

{ #category : #'tests  - DiceCup' }
DiceTest >> testDiceCupThrowsErrorWhenInitializedWithNoDie [

	self
		should: [ DiceCup withAll: {  } ]
		raiseErrorWithMessage:
		'Dice Cup should be initialized with at least one die'
]

{ #category : #'tests - LoadedDie' }
DiceTest >> testLoadedDieCannotBeLoadedWithResultLowerThanOne [

	self
		should: [ LoadedDie with: 0 ]
		raiseErrorWithMessage:
		'Die should be loaded with number greater than 0'
]

{ #category : #'tests - LoadedDie' }
DiceTest >> testLoadedDieRollsFiveWhenLoadedWithFive [

	| loadedDie rollResult |
	loadedDie := LoadedDie with: 5.
	rollResult := loadedDie roll.
	self assert: rollResult equals: 5
]

{ #category : #'tests - RandomDie' }
DiceTest >> testRandomDieCannotBeCreatedWithNumberOfFacesSmallerThanThree [

	self
		should: [ RandomDie with: 2 ]
		raiseErrorWithMessage:
		'Die cannot be created with a number of faces smaller than 3'
]

{ #category : #'tests - RandomDie' }
DiceTest >> testRandomDieRollsAndTheResultIsANumberBetweenOneAndNumberOfDieFaces [

	| aDie aRollResutl aNumberOfFaces |
	aNumberOfFaces := 4.
	aDie := RandomDie with: aNumberOfFaces.
	aRollResutl := aDie roll.

	self assert: (aRollResutl between: 1 and: aNumberOfFaces)
]

{ #category : #'tests - SequencialDie' }
DiceTest >> testSequencialLoadedDieCannotBeLoadedWithAnEmptyCollection [

	self
		should: [ SequencialLoadedDie with: #( 2 ) ]
		raiseErrorWithMessage:
		'Sequential die should be loaded with more than one number'
]

{ #category : #'tests - SequencialDie' }
DiceTest >> testSequencialLoadedDieRollsFiveAndThenEigth [

	| sequencialDie |
	sequencialDie := SequencialLoadedDie with: #(5 8).

	self assert: sequencialDie roll equals: 5.
	self assert: sequencialDie roll equals: 8.
	self assert: sequencialDie roll equals: 5
]

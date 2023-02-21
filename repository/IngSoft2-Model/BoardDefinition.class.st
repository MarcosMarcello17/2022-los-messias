"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
!
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	laps:		<Object>
	lockers:		<Object>
	parsecs:		<Object>


    Implementation Points
"
Class {
	#name : #BoardDefinition,
	#superclass : #Object,
	#instVars : [
		'lockers',
		'laps',
		'distance'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
BoardDefinition class >> assertLapsAreValid: laps [

	laps > 0 ifFalse: [ 
		Error signal: 'Board Structure cannot have less than zero laps' ]
]

{ #category : #asserting }
BoardDefinition class >> assertLockersAreValid: aNumberOfLockers [

	aNumberOfLockers > 1 ifFalse: [ 
		Error signal: 'Board Structure cannot have less than two lockers' ]
]

{ #category : #asserting }
BoardDefinition class >> assertUnitIsValid: distance [

	distance  > 0 ifFalse: [ 
		Error signal: 'Board Structure cannot have less than zero parsecs' ]
]

{ #category : #'instance creation' }
BoardDefinition class >> with: lockers and: unit played: laps [

	self assertLockersAreValid: lockers size.
	self assertUnitIsValid: unit value.
	self assertLapsAreValid: laps.
	^ self new initializeWith: lockers and: unit played: laps
]

{ #category : #accessing }
BoardDefinition >> distancePerLockerAsParsecs [

	^ (lockers size / distance valueAsParsec ) asFloat
]

{ #category : #'finding/searching' }
BoardDefinition >> findALockerOf: anEffect before: aNumberOfLocker [


	| lockerWithEffect |
	lockerWithEffect := self findLockerWith: anEffect  between: 1 and: aNumberOfLocker .
	lockerWithEffect isEmpty
		ifFalse: [ ^ lockerWithEffect first ]
		ifTrue: [ Error signal: 'Effect not in Board' ]
]

{ #category : #'finding/searching' }
BoardDefinition >> findALockerOf: anEffect closerTo: aNumberOfLocker [

	| lockerWithEffect |
	lockerWithEffect := self
		                    findLockerWith: anEffect
		                    between: aNumberOfLocker
		                    and: lockers size.
	lockerWithEffect isEmpty
		ifFalse: [ ^ lockerWithEffect first ]
		ifTrue: [^(self findALockerOf: anEffect before: aNumberOfLocker )]
]

{ #category : #'finding/searching' }
BoardDefinition >> findLockerWith: anEffect between: aNumberOfLocker and: end [

	| nextLockers lockerWithEffect |
	nextLockers := lockers copyFrom: aNumberOfLocker + 1 to: end.
	lockerWithEffect := nextLockers select: [ :eff | eff = anEffect ].
	^ lockerWithEffect
]

{ #category : #initialization }
BoardDefinition >> initializeWith: aCollectionOfLockers and: aDistance played: aNumberLaps [

	lockers := aCollectionOfLockers.
	distance := aDistance.
	laps := aNumberLaps
]

{ #category : #accessing }
BoardDefinition >> laps [
	^ laps
]

{ #category : #accessing }
BoardDefinition >> lockerAt: num [

	^ lockers at: num
]

{ #category : #accessing }
BoardDefinition >> numberOfLockers [

^ lockers size
]

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


    Implementation Points
"
Class {
	#name : #Effect,
	#superclass : #Object,
	#instVars : [
		'reverse'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
Effect >> = anEffect [

^(self class == anEffect class).
]

{ #category : #action }
Effect >> applyFor: aShip on: aBoard [ 
	^ self subclassResponsibility
]

{ #category : #initialization }
Effect >> initialize [ 

reverse := false.
]

{ #category : #private }
Effect >> reverse [

	reverse := reverse not.
]

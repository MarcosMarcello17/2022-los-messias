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
	parsecs:		<Object>


    Implementation Points
"
Class {
	#name : #Parsec,
	#superclass : #UnitMeasure,
	#instVars : [
		'parsecs'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Parsec class >> with: aNumber [ 
	^ self new initializeWith: aNumber 
]

{ #category : #initialization }
Parsec >> initializeWith: parsec [ 
	parsecs := parsec
]

{ #category : #accessing }
Parsec >> value [

	^parsecs.
]

{ #category : #converting }
Parsec >> valueAsParsec [
	^ parsecs
]

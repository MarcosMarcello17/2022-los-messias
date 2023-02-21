"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- Almacena la informacion sobre un locker afectado
"
Class {
	#name : #LockerAffected,
	#superclass : #Object,
	#instVars : [
		'effect',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
LockerAffected class >> with: anEffect at: aPosition [ 
	^self new initializeWith: anEffect at: aPosition.
]

{ #category : #accessing }
LockerAffected >> effect [
	^ effect
]

{ #category : #initialization }
LockerAffected >> initializeWith: anEffect at: aPosition [ 
	effect:= anEffect .
	position := aPosition 
]

{ #category : #accessing }
LockerAffected >> position [
	^ position
]

"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

Es una carta permanente que invierte el target de un casillero en
particular. Afecta a un solo casillero, no a todos los del tipo.
● Si afecta a 1, pasa a afectar a todos excepto a ese y viceversa. Por ejemplo, cuando una nave cae en
SpeedUp con una carta de este tipo afectandolo, entonces todas las demás naves se ven afectadas
por el efecto de SpeedUp (excepto la que cae en dicho casillero).
● Si afecta a todos, pasa a no afectar a nadie, y viceversa. Por ejemplo, AtomicBomb no afectaría a
nadie.
● Es acumulable, es decir se puede jugar una sobre otra para volver al efecto original.
"
Class {
	#name : #ReversePolarityCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
ReversePolarityCard >> = aCard [

^(self class == aCard class).
]

{ #category : #private }
ReversePolarityCard >> applyEffectTo: anEffect on: aZathuraGame by: aShip [ 
	aZathuraGame reverseEffectOf: anEffect by: aShip .
]

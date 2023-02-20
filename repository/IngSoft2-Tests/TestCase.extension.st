Extension { #name : #TestCase }

{ #category : #'*IngSoft2-Tests' }
TestCase >> should: creationOfAnObject raiseErrorWithMessage: errorMessage [

	self
		should: creationOfAnObject
		raise: Error 
		whoseDescriptionIncludes: errorMessage
		description: 'Test did not failed as expected'
]

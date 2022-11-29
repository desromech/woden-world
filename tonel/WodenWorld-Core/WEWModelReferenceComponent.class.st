"
I am an external model reference component.
"
Class {
	#name : #WEWModelReferenceComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'uri'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWModelReferenceComponent class >> actorComponentTypeName [
	^ #ModelReference
]

{ #category : #serialization }
WEWModelReferenceComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#uri . uri.
	}
]

{ #category : #testing }
WEWModelReferenceComponent >> isModelReferenceComponent [
	^ true
]

{ #category : #serialization }
WEWModelReferenceComponent >> loadFromJson: jsonData [
	super loadFromJson: jsonData.
	self uri: (jsonData at: 'uri' ifAbsent: [self uri])
]

{ #category : #accessing }
WEWModelReferenceComponent >> uri [

	^ uri
]

{ #category : #accessing }
WEWModelReferenceComponent >> uri: anObject [

	uri := anObject
]

"
I am an external model reference component.
"
Class {
	#name : #WEWModelReferenceComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'uri',
		'elementSelector'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWModelReferenceComponent class >> actorComponentTypeName [
	^ #ModelReference
]

{ #category : #'game framework' }
WEWModelReferenceComponent >> buildGameFrameworkComponent [
	^ WDGFActorAsyncModelSceneComponent new
		name: name;
		uri: uri;
		elementSelector: elementSelector;
		yourself
]

{ #category : #accessing }
WEWModelReferenceComponent >> elementSelector [

	^ elementSelector
]

{ #category : #accessing }
WEWModelReferenceComponent >> elementSelector: anObject [

	elementSelector := anObject
]

{ #category : #serialization }
WEWModelReferenceComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#elementSelector . elementSelector.
		#uri . uri.
	}
]

{ #category : #initialization }
WEWModelReferenceComponent >> initialize [
	super initialize.
	elementSelector := ''.
	uri := ''.
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

"
I am an external model reference component.
"
Class {
	#name : #WEWModelReferenceComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'uri',
		'elementSelector',
		'asyncContext'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWModelReferenceComponent class >> actorComponentTypeName [
	^ #ModelReference
]

{ #category : #accessing }
WEWModelReferenceComponent >> asyncContext [

	^ asyncContext
]

{ #category : #accessing }
WEWModelReferenceComponent >> asyncContext: anObject [

	asyncContext := anObject
]

{ #category : #'game framework' }
WEWModelReferenceComponent >> buildGameFrameworkComponent [
	^ WDGFActorAsyncModelSceneComponent new
		name: name;
		uri: uri;
		elementSelector: elementSelector;
		asyncContext: asyncContext;
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
		#uri . uri.
		#elementSelector . elementSelector.
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
WEWModelReferenceComponent >> loadFromJson: jsonData context: context [
	super loadFromJson: jsonData context: asyncContext.
	self uri: (jsonData at: 'uri' ifAbsent: [self uri]).
	self elementSelector: (jsonData at: 'elementSelector' ifAbsent: [self elementSelector]).
	self asyncContext: context.
]

{ #category : #accessing }
WEWModelReferenceComponent >> uri [

	^ uri
]

{ #category : #accessing }
WEWModelReferenceComponent >> uri: anObject [

	uri := anObject
]

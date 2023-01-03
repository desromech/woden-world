"
I am a context object which is used for assisting on document loading.
"
Class {
	#name : #WEWDocumentLoadingContext,
	#superclass : #Object,
	#instVars : [
		'asyncContext',
		'actorComponents',
		'actors'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWDocumentLoadingContext >> actorComponents [

	^ actorComponents
]

{ #category : #accessing }
WEWDocumentLoadingContext >> actors [

	^ actors
]

{ #category : #adding }
WEWDocumentLoadingContext >> addActor: anActor [
	actors add: anActor
]

{ #category : #adding }
WEWDocumentLoadingContext >> addActorComponent: anActorComponent [
	actorComponents add: anActorComponent
]

{ #category : #accessing }
WEWDocumentLoadingContext >> asyncContext [

	^ asyncContext
]

{ #category : #accessing }
WEWDocumentLoadingContext >> asyncContext: anObject [

	asyncContext := anObject
]

{ #category : #initialization }
WEWDocumentLoadingContext >> initialize [
	super initialize.
	actorComponents := OrderedCollection new.
	actors := OrderedCollection new.
]

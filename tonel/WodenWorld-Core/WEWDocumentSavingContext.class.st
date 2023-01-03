Class {
	#name : #WEWDocumentSavingContext,
	#superclass : #Object,
	#instVars : [
		'actorComponents',
		'actors',
		'tracedSet'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWDocumentSavingContext >> actorComponents [

	^ actorComponents
]

{ #category : #accessing }
WEWDocumentSavingContext >> actors [

	^ actors
]

{ #category : #adding }
WEWDocumentSavingContext >> addActor: anActor [
	(tracedSet includes: anActor) ifTrue: [ ^ self ].
	tracedSet add: anActor.
	
	anActor savingID: actors size.
	actors add: anActor.
]

{ #category : #adding }
WEWDocumentSavingContext >> addActorComponent: anActorComponent [
	(tracedSet includes: anActorComponent) ifTrue: [ ^ self ].
	tracedSet add: anActorComponent.
	
	anActorComponent savingID: actorComponents size.
	actorComponents add: anActorComponent.
]

{ #category : #initialization }
WEWDocumentSavingContext >> initialize [
	tracedSet := IdentitySet new.
	actorComponents := OrderedCollection new.
	actors := OrderedCollection new.
]

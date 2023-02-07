Class {
	#name : #WEWDocumentSavingContext,
	#superclass : #Object,
	#instVars : [
		'actorComponents',
		'actors',
		'tracedSet',
		'textures',
		'materials'
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

{ #category : #adding }
WEWDocumentSavingContext >> addMaterial: aMaterial [
	(tracedSet includes: aMaterial) ifTrue: [ ^ self ].
	tracedSet add: aMaterial.
	
	aMaterial savingID: materials size.
	actorComponents add: aMaterial.
]

{ #category : #adding }
WEWDocumentSavingContext >> addTexture: aTexture [
	(tracedSet includes: aTexture) ifTrue: [ ^ self ].
	tracedSet add: aTexture.
	
	aTexture savingID: materials size.
	textures add: aTexture.
]

{ #category : #initialization }
WEWDocumentSavingContext >> initialize [
	tracedSet := IdentitySet new.
	actorComponents := OrderedCollection new.
	actors := OrderedCollection new.
	textures := OrderedCollection new.
	materials := OrderedCollection new.

]

{ #category : #accessing }
WEWDocumentSavingContext >> materials [
	^ materials
	
]

{ #category : #accessing }
WEWDocumentSavingContext >> textures [
	^ textures
]

{ #category : #tracing }
WEWDocumentSavingContext >> trace: anObject [
	(tracedSet includes: anObject) ifTrue: [ ^ self ].
	
	anObject traceForSavingWith: self.
	
]

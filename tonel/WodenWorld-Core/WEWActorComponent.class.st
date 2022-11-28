"
I am a actor component in a Woden Engine World.
"
Class {
	#name : #WEWActorComponent,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'name',
		'type',
		'children'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWActorComponent >> children [

	^ children
]

{ #category : #initialization }
WEWActorComponent >> initialize [
	super initialize.
	name := ''.
	type := ''.
	children := OrderedCollection new.
]

{ #category : #accessing }
WEWActorComponent >> name [

	^ name
]

{ #category : #accessing }
WEWActorComponent >> name: anObject [

	name := anObject
]

{ #category : #accessing }
WEWActorComponent >> type [

	^ type
]

{ #category : #accessing }
WEWActorComponent >> type: anObject [

	type := anObject
]

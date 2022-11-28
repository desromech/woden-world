"
I am an Actor in a Woden Engine World.
"
Class {
	#name : #WEWActor,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'name',
		'components'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWActor >> components [

	^ components
]

{ #category : #initialization }
WEWActor >> initialize [
	super initialize.
	name := ''.
	components := OrderedCollection new.
]

{ #category : #accessing }
WEWActor >> name [

	^ name
]

{ #category : #accessing }
WEWActor >> name: anObject [

	name := anObject
]

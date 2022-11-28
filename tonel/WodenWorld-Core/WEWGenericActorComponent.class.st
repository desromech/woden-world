Class {
	#name : #WEWGenericActorComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'type'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWGenericActorComponent >> loadFromJson: jsonData [
	super loadFromJson: jsonData.
	self type: (jsonData at: 'type' ifAbsent: [self type])
]

{ #category : #accessing }
WEWGenericActorComponent >> type [
	^ type
]

{ #category : #accessing }
WEWGenericActorComponent >> type: anObject [

	type := anObject
]

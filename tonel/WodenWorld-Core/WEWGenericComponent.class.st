"
I am a generic component that is used for loading unsupported and user defined components.
"
Class {
	#name : #WEWGenericComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'type'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #'game framework' }
WEWGenericComponent >> buildGameFrameworkComponent [
	^ nil
]

{ #category : #testing }
WEWGenericComponent >> isGenericComponent [
	^ true
]

{ #category : #serialization }
WEWGenericComponent >> loadFromJson: jsonData context: context [
	super loadFromJson: jsonData context: context.
	self type: (jsonData at: 'type' ifAbsent: [self type])
]

{ #category : #accessing }
WEWGenericComponent >> type [
	^ type
]

{ #category : #accessing }
WEWGenericComponent >> type: anObject [

	type := anObject
]

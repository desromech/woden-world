"
I am an Actor in a Woden Engine World.
"
Class {
	#name : #WEWActor,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'name',
		'components',
		'syncMode'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #adding }
WEWActor >> addComponent: aComponent [
	components add: aComponent
]

{ #category : #'synchronization mode' }
WEWActor >> beDeterministic [
	self syncMode: #deterministic
]

{ #category : #'synchronization mode' }
WEWActor >> beNonDeterministic [
	self syncMode: #nonDeterministic
]

{ #category : #'synchronization mode' }
WEWActor >> beStatic [
	self syncMode: #static
]

{ #category : #accessing }
WEWActor >> components [

	^ components
]

{ #category : #accessing }
WEWActor >> encodeJsonKeyValues [
	^ {
		#name . name.
		#syncMode . syncMode.
		#components . components collect: [:each | each encodeForJSON ] as: Array.
	}
]

{ #category : #initialization }
WEWActor >> initialize [
	super initialize.
	self beStatic.
	name := ''.
	components := OrderedCollection new.
]

{ #category : #'synchronization mode' }
WEWActor >> isDeterministic [
	^ syncMode = #deterministic
]

{ #category : #'synchronization mode' }
WEWActor >> isNonDeterministic [
	^ syncMode = #nonDeterministic
]

{ #category : #'synchronization mode' }
WEWActor >> isStatic [
	^ syncMode = #static
]

{ #category : #serialization }
WEWActor >> loadFromJson: jsonData [
	self name: (jsonData at: 'name' ifAbsent: [self name]).
	self syncMode: (jsonData at: 'synchronizationMode' ifAbsent: [self syncMode]).
	jsonData at: 'components' ifPresent: [ :componentList |
		componentList do: [ :eachComponent |
			self addComponent: (WEWActorComponent loadFromJson: eachComponent)
		]
	].

]

{ #category : #accessing }
WEWActor >> name [

	^ name
]

{ #category : #accessing }
WEWActor >> name: anObject [

	name := anObject
]

{ #category : #accessing }
WEWActor >> syncMode [

	^ syncMode
]

{ #category : #accessing }
WEWActor >> syncMode: aSynchronizationModeName [
	self assert: (#(static deterministic nonDeterministic) includes: aSynchronizationModeName).
	syncMode := aSynchronizationModeName asSymbol
]

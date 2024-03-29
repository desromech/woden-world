"
I am an Actor in a Woden Engine World.
"
Class {
	#name : #WEWActor,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'name',
		'components',
		'syncMode',
		'savingID'
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

{ #category : #'game framework' }
WEWActor >> buildGameFrameworkActor [
	| actor |
	actor := WDGFActor new.
	actor name: name.
	components do: [ :eachComponent |
		eachComponent buildGameFrameworkComponent ifNotNil: [ :component |
			actor addComponent: component
		].
	].

	^ actor
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
		#components . components collect: [:each | each savingID ] as: Array.
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
WEWActor >> loadFromJson: jsonData context: context [
	self name: (jsonData at: 'name' ifAbsent: [self name]).
	self syncMode: (jsonData at: 'synchronizationMode' ifAbsent: [self syncMode]).
	
]

{ #category : #serialization }
WEWActor >> loadReferencesFromJson: jsonData context: context [
	jsonData at: 'components' ifPresent: [ :componentList |
		componentList do: [ :eachComponentIndex |
			self addComponent: (context actorComponents at: eachComponentIndex + 1)
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
WEWActor >> savingID [

	^ savingID
]

{ #category : #accessing }
WEWActor >> savingID: anObject [

	savingID := anObject
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

{ #category : #serialization }
WEWActor >> traceForSavingWith: savingContext [
	savingContext addActor: self.
	components do: [:each | savingContext trace: each ].
]

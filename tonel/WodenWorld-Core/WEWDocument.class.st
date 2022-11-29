"
I represent a specific Woden Engine World (WEW) document.
"
Class {
	#name : #WEWDocument,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'actors',
		'metadata'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWDocument >> actors [
	^ actors
]

{ #category : #adding }
WEWDocument >> addActor: anActor [
	actors add: anActor
]

{ #category : #'game framework' }
WEWDocument >> buildGameFrameworkWorld [
	| world |
	world := WDGFWorld new.
	actors do: [ :each |
		world spawnActor: each buildGameFrameworkActor
	].
	^ world
]

{ #category : #serialization }
WEWDocument >> encodeJsonKeyValues [
	^ {
		#metadata . metadata encodeForJSON.
		#actors . actors collect: [:each | each encodeForJSON ] as: Array.
	}
]

{ #category : #initialization }
WEWDocument >> initialize [
	super initialize.
	actors := OrderedCollection new.
	metadata := WEWMetadata new.
]

{ #category : #serialization }
WEWDocument >> loadFromJson: jsonData [
	jsonData at: 'metadata' ifPresent: [ :found |
		self metadata: (WEWMetadata loadFromJson: found)
	].

	jsonData at: 'actors' ifPresent: [ :actorList |
		actorList do: [ :eachActor |
			self addActor: (WEWActor loadFromJson: eachActor)
		]
	].

]

{ #category : #accessing }
WEWDocument >> metadata [

	^ metadata
]

{ #category : #accessing }
WEWDocument >> metadata: anObject [

	metadata := anObject
]

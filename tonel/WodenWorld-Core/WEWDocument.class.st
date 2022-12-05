"
I represent a specific Woden Engine World (WEW) document.
"
Class {
	#name : #WEWDocument,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'actors',
		'metadata',
		'landmarks'
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

{ #category : #adding }
WEWDocument >> addLandmark: aLandmark [
	landmarks add: aLandmark
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

{ #category : #'game framework' }
WEWDocument >> buildGameFrameworkWorldWithDefaultAvatar [
	^ self buildGameFrameworkWorld
		spawnActor: (WDGFActorTemplates noclipCameraActor
			transform: self defaultAvatarLandmarkTransform;
			yourself);
		yourself
]

{ #category : #accessing }
WEWDocument >> defaultAvatarLandmarkTransform [
	^ landmarks isEmpty
		ifTrue: [ TRSTransform3D identity ]
		ifFalse: [ landmarks first transform ]
]

{ #category : #serialization }
WEWDocument >> encodeJsonKeyValues [
	^ {
		#metadata . metadata encodeForJSON.
		#actors . actors collect: [:each | each encodeForJSON ] as: Array.
		#landmarks . landmarks collect: [:each | each encodeForJSON ] as: Array.
	}
]

{ #category : #initialization }
WEWDocument >> initialize [
	super initialize.
	actors := OrderedCollection new.
	landmarks := OrderedCollection new.
	metadata := WEWMetadata new.
]

{ #category : #accessing }
WEWDocument >> landmarks [
	^ landmarks
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

	jsonData at: 'landmarks' ifPresent: [ :landmarkList |
		landmarkList do: [ :eachLandmark |
			self addLandmark: (WEWLandmark loadFromJson: eachLandmark)
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

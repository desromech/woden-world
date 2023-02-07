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
	| saveContext |
	saveContext := WEWDocumentSavingContext new.
	actors do: [:each |
		saveContext trace: each
	].

	^ {
		#metadata . metadata encodeForJSON.
		#actorComponents . saveContext actorComponents collect: [:each | each encodeForJSON ] as: Array.
		#actors . saveContext actors collect: [:each | each encodeForJSON ] as: Array.
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
WEWDocument >> loadFromJson: jsonData context: context [
	jsonData at: 'metadata' ifPresent: [ :found |
		self metadata: (WEWMetadata loadFromJson: found context: context)
	].

	jsonData at: 'actorComponents' ifPresent: [ :actorComponentList |
		actorComponentList do: [ :eachActorComponent |
			context addActorComponent: (WEWActorComponent loadFromJson: eachActorComponent context: context)			
		].
	].

	jsonData at: 'actors' ifPresent: [ :actorList |
		actorList do: [ :eachActor |
			| loadedActor |
			loadedActor := WEWActor loadFromJson: eachActor context: context.
			context addActor: loadedActor.
			self addActor: loadedActor
		].

		actorList doWithIndex:  [ :eachActor :actorIndex |
			(actors at: actorIndex) loadReferencesFromJson: eachActor context: context
		].
	].

	jsonData at: 'actorComponents' ifPresent: [ :actorComponentList |
		actorComponentList doWithIndex: [ :eachActorComponent :actorComponentIndex |
			(context actorComponents at: actorComponentIndex) loadReferencesFromJson: eachActorComponent context: context
		].
	].

	jsonData at: 'landmarks' ifPresent: [ :landmarkList |
		landmarkList do: [ :eachLandmark |
			self addLandmark: (WEWLandmark loadFromJson: eachLandmark context: context)
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

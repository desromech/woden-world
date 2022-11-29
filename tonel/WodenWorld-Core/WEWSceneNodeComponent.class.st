"
I am a scene node component. I provide a transform that is decomposed in terms of scale, rotation and translation. I can also have additional scene node components.
"
Class {
	#name : #WEWSceneNodeComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'transform',
		'children'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #'as yet unclassified' }
WEWSceneNodeComponent class >> actorComponentTypeName [
	^ #SceneNode
]

{ #category : #adding }
WEWSceneNodeComponent >> addChild: aChildComponent [
	children add: aChildComponent
]

{ #category : #accessing }
WEWSceneNodeComponent >> children [
	^ children
]

{ #category : #accessing }
WEWSceneNodeComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#transform . transform encodeForJSON.
		#children . children collect: [:each | each encodeForJSON ] as: Array.
	}
]

{ #category : #initialization }
WEWSceneNodeComponent >> initialize [
	super initialize.
	transform := TRSTransform3D identity.
	children := OrderedCollection new.
]

{ #category : #testing }
WEWSceneNodeComponent >> isSceneNodeComponent [
	^ true
]

{ #category : #serialization }
WEWSceneNodeComponent >> loadFromJson: jsonData [
	super loadFromJson: jsonData.
	jsonData at: 'transform' ifPresent: [:found |
		self transform: (TRSTransform3D loadFromJson: found)
	].
	
	jsonData at: 'children' ifPresent: [ :childrenList |
		childrenList do: [ :eachChild |
			self addChild: (WEWActorComponent loadFromJson: eachChild)
		]
	].
]

{ #category : #accessing }
WEWSceneNodeComponent >> orientation [
	^ transform rotation
]

{ #category : #accessing }
WEWSceneNodeComponent >> orientation: anOrientation [
	transform rotation: anOrientation
]

{ #category : #accessing }
WEWSceneNodeComponent >> position [
	^ transform translation
]

{ #category : #accessing }
WEWSceneNodeComponent >> position: aPosition [
	transform translation: aPosition
]

{ #category : #accessing }
WEWSceneNodeComponent >> scale [
	^ transform scale
]

{ #category : #accessing }
WEWSceneNodeComponent >> scale: aScale [
	transform scale: aScale
]

{ #category : #accessing }
WEWSceneNodeComponent >> transform [

	^ transform
]

{ #category : #accessing }
WEWSceneNodeComponent >> transform: anObject [

	transform := anObject
]

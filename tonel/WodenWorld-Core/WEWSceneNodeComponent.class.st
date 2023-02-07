"
I am a scene node component. I provide a transform that is decomposed in terms of scale, rotation and translation. I can also have additional scene node components.
"
Class {
	#name : #WEWSceneNodeComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'transform',
		'children',
		'sceneBackground'
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

{ #category : #'game framework' }
WEWSceneNodeComponent >> buildGameFrameworkComponent [
	| sceneComponent |
	sceneComponent := WDGFActorSceneComponent new
		name: name;
		transform: transform;
		sceneBackground: sceneBackground;
		yourself.
	children do: [ :eachChild |
		eachChild buildGameFrameworkComponent ifNotNil: [ :childComponent |
			sceneComponent addChildSceneComponent: childComponent
		]
	].

	^ sceneComponent
]

{ #category : #accessing }
WEWSceneNodeComponent >> children [
	^ children
]

{ #category : #serialization }
WEWSceneNodeComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#transform . transform encodeForJSON.
		#children . children collect: [:each | each savingID ] as: Array.
		#sceneBackground . sceneBackground.
	}
]

{ #category : #initialization }
WEWSceneNodeComponent >> initialize [
	super initialize.
	transform := TRSTransform3D identity.
	children := OrderedCollection new.
	sceneBackground := false.
]

{ #category : #testing }
WEWSceneNodeComponent >> isSceneNodeComponent [
	^ true
]

{ #category : #serialization }
WEWSceneNodeComponent >> loadFromJson: jsonData context: context [
	super loadFromJson: jsonData context: context.
	self sceneBackground: (jsonData at: 'sceneBackground' ifAbsent: [self sceneBackground]).
	jsonData at: 'transform' ifPresent: [:found |
		self transform: (TRSTransform3D loadFromJson: found)
	].
	
]

{ #category : #serialization }
WEWSceneNodeComponent >> loadReferencesFromJson: jsonData context: context [
	super loadReferencesFromJson: jsonData context: context.
	jsonData at: 'children' ifPresent: [ :childrenList |
		childrenList do: [ :eachChildIndex |
			self addChild: (context actorComponents at: eachChildIndex + 1)
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

{ #category : #transforming }
WEWSceneNodeComponent >> rotateDegreesOnX: rotation [
	transform rotateDegreesOnX: rotation.
]

{ #category : #transforming }
WEWSceneNodeComponent >> rotateDegreesOnY: rotation [
	transform rotateDegreesOnY: rotation.
]

{ #category : #transforming }
WEWSceneNodeComponent >> rotateDegreesOnZ: rotation [
	transform rotateDegreesOnZ: rotation.
]

{ #category : #transforming }
WEWSceneNodeComponent >> rotateRadiansOnX: rotation [
	transform rotateRadiansOnX: rotation.
]

{ #category : #transforming }
WEWSceneNodeComponent >> rotateRadiansOnY: rotation [
	transform rotateRadiansOnY: rotation.
]

{ #category : #transforming }
WEWSceneNodeComponent >> rotateRadiansOnZ: rotation [
	transform rotateRadiansOnZ: rotation.
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
WEWSceneNodeComponent >> sceneBackground [

	^ sceneBackground
]

{ #category : #accessing }
WEWSceneNodeComponent >> sceneBackground: anObject [

	sceneBackground := anObject
]

{ #category : #'as yet unclassified' }
WEWSceneNodeComponent >> traceForSavingWith: savingContext [
	super traceForSavingWith: savingContext.
	children do:[:each | savingContext trace: each ]
]

{ #category : #accessing }
WEWSceneNodeComponent >> transform [

	^ transform
]

{ #category : #accessing }
WEWSceneNodeComponent >> transform: anObject [

	transform := anObject
]

{ #category : #transforming }
WEWSceneNodeComponent >> translateBy: aVector [
	transform translateBy: aVector.
]

{ #category : #transforming }
WEWSceneNodeComponent >> translateByX: amount [
	transform translateByX: amount.
]

{ #category : #transforming }
WEWSceneNodeComponent >> translateByY: amount [
	transform translateByY: amount.
]

{ #category : #transforming }
WEWSceneNodeComponent >> translateByZ: amount [
	transform translateByZ: amount.
]

{ #category : #transforming }
WEWSceneNodeComponent >> translateToX: x y: y z: z [
	transform translateToX: x y: y z: z.
]

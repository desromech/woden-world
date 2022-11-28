Class {
	#name : #WEWActorSceneComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'transform',
		'children'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #'as yet unclassified' }
WEWActorSceneComponent class >> actorComponentTypeName [
	^ #SceneComponent
]

{ #category : #accessing }
WEWActorSceneComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#transform . transform encodeForJSON.
		#children . children collect: [:each | each encodeForJSON ] as: Array.
	}
]

{ #category : #initialization }
WEWActorSceneComponent >> initialize [
	super initialize.
	transform := TRSTransform3D identity.
	children := OrderedCollection new.
]

{ #category : #serialization }
WEWActorSceneComponent >> loadFromJson: jsonData [
	super loadFromJson: jsonData.
	jsonData at: 'transform' ifPresent: [:found | TRSTransform3D loadFromJson: jsonData]
]

{ #category : #accessing }
WEWActorSceneComponent >> transform [

	^ transform
]

{ #category : #accessing }
WEWActorSceneComponent >> transform: anObject [

	transform := anObject
]

"
I am a box mesh component.
"
Class {
	#name : #WEWBoxMeshComponent,
	#superclass : #WEWProceduralMeshComponent,
	#instVars : [
		'halfExtent'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWBoxMeshComponent class >> actorComponentTypeName [
	^ #BoxMesh
]

{ #category : #hooks }
WEWBoxMeshComponent >> buildMeshWith: meshBuilder [
	meshBuilder addCubeWithHalfExtent: halfExtent
]

{ #category : #accessing }
WEWBoxMeshComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#halfExtent . halfExtent encodeForJSON.
	}
]

{ #category : #accessing }
WEWBoxMeshComponent >> halfExtent [

	^ halfExtent
]

{ #category : #accessing }
WEWBoxMeshComponent >> halfExtent: anObject [

	halfExtent := anObject
]

{ #category : #initialization }
WEWBoxMeshComponent >> initialize [
	super initialize.
	halfExtent := Vector3 ones.
]

{ #category : #testing }
WEWBoxMeshComponent >> isBoxMeshComponent [
	^ true
]

{ #category : #serialization }
WEWBoxMeshComponent >> loadFromJson: jsonData context: context [
	super loadFromJson: jsonData context: context.
	jsonData at: 'halfExtent' ifPresent: [:found |
		self halfExtent: (Vector3 loadFromJson: found)
	].
]

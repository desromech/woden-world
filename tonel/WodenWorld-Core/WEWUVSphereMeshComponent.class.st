Class {
	#name : #WEWUVSphereMeshComponent,
	#superclass : #WEWProceduralMeshComponent,
	#instVars : [
		'radius',
		'slices',
		'segments'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWUVSphereMeshComponent class >> actorComponentTypeName [
	^ #UVSphereMesh
]

{ #category : #hooks }
WEWUVSphereMeshComponent >> buildMeshWith: meshBuilder [
	meshBuilder addUVSphereWithRadius: radius segments: segments slices: slices
]

{ #category : #accessing }
WEWUVSphereMeshComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#radius . radius.
		#segments . segments.
		#slices . slices.
	}
]

{ #category : #serialization }
WEWUVSphereMeshComponent >> loadFromJson: jsonData [
	super loadFromJson: jsonData.
	self radius: (jsonData at: 'radius' ifAbsent: [self radius]).
	self segments: (jsonData at: 'segments' ifAbsent: [self segments]).
	self slices: (jsonData at: 'slices' ifAbsent: [self slices]).
	
]

{ #category : #accessing }
WEWUVSphereMeshComponent >> radius [

	^ radius
]

{ #category : #accessing }
WEWUVSphereMeshComponent >> radius: anObject [

	radius := anObject
]

{ #category : #accessing }
WEWUVSphereMeshComponent >> segments [

	^ segments
]

{ #category : #accessing }
WEWUVSphereMeshComponent >> segments: anObject [

	segments := anObject
]

{ #category : #accessing }
WEWUVSphereMeshComponent >> slices [

	^ slices
]

{ #category : #accessing }
WEWUVSphereMeshComponent >> slices: anObject [

	slices := anObject
]

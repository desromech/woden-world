"
I am a procedural mesh component. I am provided to facilitate prototyping scenes.
"
Class {
	#name : #WEWProceduralMeshComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'material'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #'game framework' }
WEWProceduralMeshComponent >> buildGameFrameworkComponent [
	| meshBuilder mesh |
	meshBuilder := WDMeshBuilder new.
	self buildMeshWith: meshBuilder.
	mesh := meshBuilder mesh.
	
	^ WDGFActorMeshSceneComponent new
		name: name;
		mesh: mesh;
		yourself
]

{ #category : #hooks }
WEWProceduralMeshComponent >> buildMeshWith: meshBuilder [
	self subclassResponsibility
]

{ #category : #accessing }
WEWProceduralMeshComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#material . material ifNotNil: [ material savingID ].
	}
]

{ #category : #testing }
WEWProceduralMeshComponent >> isProceduralMeshComponent [
	^ true
]

{ #category : #serialization }
WEWProceduralMeshComponent >> loadFromJson: jsonData context: context [
	super loadFromJson: jsonData context: context.
	jsonData at: 'material' ifPresent: [:found |
		self material: (jsonData materials at: found + 1)
	].
]

{ #category : #accessing }
WEWProceduralMeshComponent >> material [

	^ material
]

{ #category : #accessing }
WEWProceduralMeshComponent >> material: anObject [

	material := anObject
]

{ #category : #serialization }
WEWProceduralMeshComponent >> traceForSavingWith: savingContext [
	super traceForSavingWith: savingContext.
	material ifNotNil: [ savingContext trace: material ].
]

"
I am a procedural mesh component. I am provided to facilitate prototyping scenes.
"
Class {
	#name : #WEWProceduralMeshComponent,
	#superclass : #WEWActorComponent,
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

{ #category : #testing }
WEWProceduralMeshComponent >> isProceduralMeshComponent [
	^ true
]

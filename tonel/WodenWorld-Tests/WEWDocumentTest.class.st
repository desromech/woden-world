"
A WodenEngineWorldTest is a test class for testing the behavior of WodenEngineWorld
"
Class {
	#name : #WEWDocumentTest,
	#superclass : #TestCase,
	#category : #'WodenWorld-Tests'
}

{ #category : #tests }
WEWDocumentTest >> testActor [
	| wew actor jsonString loadedWew loadedActor |
	wew := WEWDocument new.
	self assert: wew actors isEmpty.
	
	actor := WEWActor new
		name: 'TestActor';
		yourself.
	wew addActor: actor.
	self assert: actor isStatic.
	self assert: actor name equals: 'TestActor'.
	self assert: wew actors size equals: 1.
	
	jsonString := wew encodeAsJSONString.
	loadedWew := WEWDocument loadFromJsonString: jsonString.
	self assert: loadedWew actors size equals: 1.
	
	loadedActor := loadedWew actors first.
	self assert: loadedActor isStatic.
	self assert: loadedActor name equals: 'TestActor'.

]

{ #category : #tests }
WEWDocumentTest >> testActorWithBoxMesh [
	| wew jsonString loadedWew loadedActor sceneNodeComponent boxMeshComponent |
	wew := WEWDocument new.

	wew addActor: (WEWActor new
		name: 'Cube';
		addComponent: (WEWSceneNodeComponent new
			position: (Vector3 x: 1 y: 2 z: 3);
			addChild: (WEWBoxMeshComponent new
				halfExtent: (Vector3 x: 0.5 y: 1.0 z: 1.5);
				yourself)
		);
		yourself).
	self assert: wew actors size equals: 1.

	jsonString := wew encodeAsJSONString.
	loadedWew := WEWDocument loadFromJsonString: jsonString.
	self assert: loadedWew actors size equals: 1.
	
	loadedActor := loadedWew actors first.
	self assert: loadedActor name equals: 'Cube'.

	self assert: loadedActor components size equals: 1.
	self assert: loadedActor components first isSceneNodeComponent.
	
	sceneNodeComponent := loadedActor components first.
	self assert: sceneNodeComponent position equals: (Vector3 x: 1 y: 2 z: 3).
	
	self assert: sceneNodeComponent children size equals: 1.
	self assert: sceneNodeComponent children first isBoxMeshComponent.

	boxMeshComponent := sceneNodeComponent children first.
	self assert: boxMeshComponent halfExtent equals: (Vector3 x: 0.5 y: 1.0 z: 1.5).

]

{ #category : #tests }
WEWDocumentTest >> testNew [
	| wew jsonString loadedWew |
	wew := WEWDocument new.
	self assert: wew actors isEmpty.
	
	jsonString := wew encodeAsJSONString.
	loadedWew := WEWDocument loadFromJsonString: jsonString.
	self assert: loadedWew actors isEmpty
]

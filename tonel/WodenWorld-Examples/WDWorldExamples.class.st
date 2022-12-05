"
I hold multiple examples of the different Woden world APIs.
"
Class {
	#name : #WDWorldExamples,
	#superclass : #Object,
	#category : #'WodenWorld-Examples'
}

{ #category : #'as yet unclassified' }
WDWorldExamples class >> cubeWorld [
	^ WEWDocument new
		addLandmark: (WEWLandmark new
			name: 'Start';
			position: (Vector3 z: 3);
			yourself);
		addActor: (WEWActor new
			addComponent: (WEWSceneNodeComponent new
				rotateDegreesOnX: -45;
				rotateDegreesOnY: -135;
				addChild: (WEWLightSourceComponent new
					beDirectional;
					color: (Vector3 x: 0.8 y: 0.8 z: 0.7);
					yourself)
			);
			yourself);
		addActor: (WEWActor new
			addComponent: (WEWSceneNodeComponent new
				addChild: (WEWBoxMeshComponent new
					yourself)
			);
			yourself);
		yourself
]

{ #category : #'see class side' }
WDWorldExamples >> seeClassSide [
]

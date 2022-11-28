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
WEWDocumentTest >> testNew [
	| wew jsonString loadedWew |
	wew := WEWDocument new.
	self assert: wew actors isEmpty.
	
	jsonString := wew encodeAsJSONString.
	loadedWew := WEWDocument loadFromJsonString: jsonString.
	self assert: loadedWew actors isEmpty
]

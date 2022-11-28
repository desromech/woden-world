"
A WodenEngineWorldTest is a test class for testing the behavior of WodenEngineWorld
"
Class {
	#name : #WEWDocumentTest,
	#superclass : #TestCase,
	#category : #'WodenWorld-Tests'
}

{ #category : #tests }
WEWDocumentTest >> testNew [
	| wew jsonString loadedWew |
	wew := WEWDocument new.
	self assert: wew actors isEmpty.
	
	jsonString := wew encodeAsJSONString.
	loadedWew := WEWDocument loadFromJsonString: jsonString.
	self assert: loadedWew actors isEmpty
]

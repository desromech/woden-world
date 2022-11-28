"
I represent a specific Woden Engine World (WEW) document object. I provide some facilities for JSON based serialization.
"
Class {
	#name : #WEWDocumentObject,
	#superclass : #Object,
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWDocumentObject class >> loadFromJson: jsonData [
	^ self new loadFromJson: jsonData; yourself
]

{ #category : #serialization }
WEWDocumentObject class >> loadFromJsonString: jsonString [
	^ self loadFromJson: (STONJSON fromString: jsonString)
]

{ #category : #serialization }
WEWDocumentObject >> encodeAsJSONString [
	^ (STONJSON toStringPretty: self encodeForJSON) withUnixLineEndings
]

{ #category : #serialization }
WEWDocumentObject >> encodeForJSON [
	^ OrderedDictionary newFromPairs: self encodeJsonKeyValues
]

{ #category : #serialization }
WEWDocumentObject >> encodeJsonKeyValues [
	^ #()
]

{ #category : #serialization }
WEWDocumentObject >> loadFromJson: jsonData [
	self subclassResponsibility
]

{ #category : #serialization }
WEWDocumentObject >> saveTo: aFileName [
	| encodedData |
	encodedData := self encodeAsJSONString.
	aFileName asFileReference writeStreamDo: [ :out | out truncate; nextPutAll: encodedData ]
]

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
	^ self loadFromJson: jsonData context: WEWDocumentLoadingContext new
]

{ #category : #serialization }
WEWDocumentObject class >> loadFromJson: jsonData context: context [
	^ self new loadFromJson: jsonData context: context; yourself
]

{ #category : #serialization }
WEWDocumentObject class >> loadFromJsonString: jsonData [
	^ self loadFromJsonString: jsonData context: WEWDocumentLoadingContext new
]

{ #category : #serialization }
WEWDocumentObject class >> loadFromJsonString: jsonString context: context [
	^ self loadFromJson: (STONJSON fromString: jsonString) context: context
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
	self subclassResponsibility
]

{ #category : #serialization }
WEWDocumentObject >> loadFromJson: jsonData context: context [
	self subclassResponsibility
]

{ #category : #serialization }
WEWDocumentObject >> loadReferencesFromJson: jsonData context: context [
	self subclassResponsibility
]

{ #category : #serialization }
WEWDocumentObject >> saveTo: aFileName [
	| encodedData |
	encodedData := self encodeAsJSONString.
	aFileName asFileReference writeStreamDo: [ :out | out truncate; nextPutAll: encodedData ]
]

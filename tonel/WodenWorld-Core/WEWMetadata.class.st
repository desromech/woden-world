"
I hold different pieces of metadata of a Woden Engine World document.
"
Class {
	#name : #WEWMetadata,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'formatVersion',
		'documentVersion',
		'name',
		'title',
		'description',
		'copyright',
		'optionalExtensions',
		'requiredExtensions'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWMetadata >> copyright [

	^ copyright
]

{ #category : #accessing }
WEWMetadata >> copyright: anObject [

	copyright := anObject
]

{ #category : #accessing }
WEWMetadata >> description [

	^ description
]

{ #category : #accessing }
WEWMetadata >> description: anObject [

	description := anObject
]

{ #category : #accessing }
WEWMetadata >> documentVersion [

	^ documentVersion
]

{ #category : #accessing }
WEWMetadata >> documentVersion: anObject [

	documentVersion := anObject
]

{ #category : #serialization }
WEWMetadata >> encodeJsonKeyValues [
	^ {
		#formatVersion . formatVersion.
		#documentVersion . documentVersion.
		#name . name.
		#title . title.
		#description . description.
		#copyright . copyright.
		#optionalExtensions . optionalExtensions asArray.
		#requiredExtensions . requiredExtensions asArray.
	}
]

{ #category : #accessing }
WEWMetadata >> formatVersion [

	^ formatVersion
]

{ #category : #accessing }
WEWMetadata >> formatVersion: anObject [

	formatVersion := anObject
]

{ #category : #initialization }
WEWMetadata >> initialize [
	super initialize.
	formatVersion := '0.1'.
	documentVersion := ''.
	name := ''.
	title := ''.
	description := ''.
	copyright := ''.
	optionalExtensions := OrderedCollection new.
	requiredExtensions := OrderedCollection new.
]

{ #category : #serialization }
WEWMetadata >> loadFromJson: jsonData [
	self formatVersion: (jsonData at: 'formatVersion' ifAbsent: [self formatVersion]).
	self name: (jsonData at: 'name' ifAbsent: [self name]).
	self title: (jsonData at: 'title' ifAbsent: [self title]).
	self description: (jsonData at: 'description' ifAbsent: [self description]).
	self copyright: (jsonData at: 'description' ifAbsent: [self description]).
	(jsonData at: 'optionalExtensions' ifPresent: [:extensionList |
		optionalExtensions := extensionList asOrderedCollection
	]).
	(jsonData at: 'requiredExtensions' ifPresent: [:extensionList |
		requiredExtensions := extensionList asOrderedCollection
	]).
	
]

{ #category : #accessing }
WEWMetadata >> name [

	^ name
]

{ #category : #accessing }
WEWMetadata >> name: anObject [

	name := anObject
]

{ #category : #accessing }
WEWMetadata >> optionalExtensions [

	^ optionalExtensions
]

{ #category : #accessing }
WEWMetadata >> optionalExtensions: anObject [

	optionalExtensions := anObject
]

{ #category : #accessing }
WEWMetadata >> requiredExtensions [

	^ requiredExtensions
]

{ #category : #accessing }
WEWMetadata >> requiredExtensions: anObject [

	requiredExtensions := anObject
]

{ #category : #accessing }
WEWMetadata >> title [

	^ title
]

{ #category : #accessing }
WEWMetadata >> title: anObject [

	title := anObject
]

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
		'extensionsRequired',
		'extensionsUsed'
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
		#extensionsUsed . extensionsUsed asArray.
		#extensionsRequired . extensionsRequired asArray.
	}
]

{ #category : #accessing }
WEWMetadata >> extensionsRequired [

	^ extensionsRequired
]

{ #category : #accessing }
WEWMetadata >> extensionsRequired: anObject [

	extensionsRequired := anObject
]

{ #category : #accessing }
WEWMetadata >> extensionsUsed [

	^ extensionsUsed
]

{ #category : #accessing }
WEWMetadata >> extensionsUsed: anObject [

	extensionsUsed := anObject
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
	extensionsUsed := OrderedCollection new.
	extensionsRequired := OrderedCollection new.
]

{ #category : #serialization }
WEWMetadata >> loadFromJson: jsonData [
	self formatVersion: (jsonData at: 'formatVersion' ifAbsent: [self formatVersion]).
	self name: (jsonData at: 'name' ifAbsent: [self name]).
	self title: (jsonData at: 'title' ifAbsent: [self title]).
	self description: (jsonData at: 'description' ifAbsent: [self description]).
	self copyright: (jsonData at: 'copyright' ifAbsent: [self copyright]).
	(jsonData at: 'extensionsUsed' ifPresent: [:extensionList |
		extensionsUsed := extensionList asOrderedCollection
	]).
	(jsonData at: 'extensionsRequired' ifPresent: [:extensionList |
		extensionsRequired := extensionList asOrderedCollection
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
WEWMetadata >> title [

	^ title
]

{ #category : #accessing }
WEWMetadata >> title: anObject [

	title := anObject
]

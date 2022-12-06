"
I represent a specific point (with position, orientation and scale) in the world that is given a name and an optional description.
"
Class {
	#name : #WEWLandmark,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'name',
		'description',
		'transform'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWLandmark >> description [

	^ description
]

{ #category : #accessing }
WEWLandmark >> description: anObject [

	description := anObject
]

{ #category : #serialization }
WEWLandmark >> encodeJsonKeyValues [
	^ {
		#name . name.
		#description . description.
		#transform . transform encodeForJSON.
	}
]

{ #category : #initialization }
WEWLandmark >> initialize [
	super initialize.
	name := ''.
	description := ''.
	transform := TRSTransform3D identity.
]

{ #category : #serialization }
WEWLandmark >> loadFromJson: jsonData context: asyncContext [
	self name: (jsonData at: 'name' ifAbsent: [self name]).
	self description: (jsonData at: 'description' ifAbsent: [self description]).

	jsonData at: 'transform' ifPresent: [:found |
		self transform: (TRSTransform3D loadFromJson: found)
	].
]

{ #category : #accessing }
WEWLandmark >> name [

	^ name
]

{ #category : #accessing }
WEWLandmark >> name: anObject [

	name := anObject
]

{ #category : #accessing }
WEWLandmark >> orientation [
	^ transform rotation
]

{ #category : #accessing }
WEWLandmark >> orientation: anOrientation [
	transform rotation: anOrientation
]

{ #category : #accessing }
WEWLandmark >> position [
	^ transform translation
]

{ #category : #accessing }
WEWLandmark >> position: aPosition [
	transform translation: aPosition
]

{ #category : #accessing }
WEWLandmark >> scale [
	^ transform scale
]

{ #category : #accessing }
WEWLandmark >> scale: aScale [
	transform scale: aScale
]

{ #category : #accessing }
WEWLandmark >> transform [

	^ transform
]

{ #category : #accessing }
WEWLandmark >> transform: anObject [

	transform := anObject
]

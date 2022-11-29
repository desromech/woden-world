"
I am a actor component in a Woden Engine World.
"
Class {
	#name : #WEWActorComponent,
	#superclass : #WEWDocumentObject,
	#instVars : [
		'name'
	],
	#classVars : [
		'ActorComponentTypeNameToClassDictionary'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWActorComponent class >> actorComponentClassForType: typeName [
	^ ActorComponentTypeNameToClassDictionary at: typeName ifAbsent: [ WEWGenericComponent ]
]

{ #category : #serialization }
WEWActorComponent class >> actorComponentTypeName [
	^ nil
]

{ #category : #initialization }
WEWActorComponent class >> initialize [
	ActorComponentTypeNameToClassDictionary := Dictionary new.
	self withAllSubclassesDo: [ :eachClass |
		eachClass actorComponentTypeName ifNotNil: [ :typeName |
			ActorComponentTypeNameToClassDictionary at: typeName put: eachClass
		]
	].
]

{ #category : #serialization }
WEWActorComponent class >> loadFromJson: jsonData [
	^ (self actorComponentClassForType: (jsonData at: 'type' ifAbsent: [nil])) new
		loadFromJson: jsonData;
		yourself
]

{ #category : #serialization }
WEWActorComponent >> encodeJsonKeyValues [
	^ {
		#name . name.
		#type . self type.
	}
]

{ #category : #initialization }
WEWActorComponent >> initialize [
	super initialize.
	name := ''.
]

{ #category : #testing }
WEWActorComponent >> isBoxMeshComponent [
	^ false
]

{ #category : #testing }
WEWActorComponent >> isGenericComponent [
	^ false
]

{ #category : #testing }
WEWActorComponent >> isLightSourceComponent [
	^ false
]

{ #category : #testing }
WEWActorComponent >> isModelReferenceComponent [
	^ false
]

{ #category : #testing }
WEWActorComponent >> isProceduralMeshComponent [
	^ false
]

{ #category : #testing }
WEWActorComponent >> isSceneNodeComponent [
	^ false
]

{ #category : #serialization }
WEWActorComponent >> loadFromJson: jsonData [
	self name: (jsonData at: 'name' ifAbsent: [self name])
]

{ #category : #accessing }
WEWActorComponent >> name [

	^ name
]

{ #category : #accessing }
WEWActorComponent >> name: anObject [

	name := anObject
]

{ #category : #accessing }
WEWActorComponent >> type [
	^ self class actorComponentTypeName
]

Class {
	#name : #WEWMetallicRoughnessMaterial,
	#superclass : #WEWMaterial,
	#instVars : [
		'baseColorFactor',
		'baseColorTexture',
		'emissiveFactor',
		'emissiveTexture',
		'normalTexture',
		'occlusionFactor',
		'occlusionTexture',
		'metallicFactor',
		'roughnessFactor',
		'metallicRoughnessTexture',
		'texcoordScale',
		'texcoordOffset',
		'texcoordOffsetVelocity'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> baseColorFactor [

	^ baseColorFactor
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> baseColorFactor: anObject [

	baseColorFactor := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> baseColorTexture [

	^ baseColorTexture
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> baseColorTexture: anObject [

	baseColorTexture := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> emissiveFactor [

	^ emissiveFactor
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> emissiveFactor: anObject [

	emissiveFactor := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> emissiveTexture [

	^ emissiveTexture
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> emissiveTexture: anObject [

	emissiveTexture := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#baseColorFactor . baseColorFactor encodeForJSON.
		#baseColorTexture . baseColorTexture ifNotNil: [:texture | texture savingID].
		#emissiveFactor . emissiveFactor encodeForJSON.
		#emissiveTexture . emissiveTexture ifNotNil: [:texture | texture savingID].
		#normalTexture . normalTexture ifNotNil: [:texture | texture savingID].
		#occlusionFactor . occlusionFactor.
		#occlusionTexture . occlusionTexture ifNotNil: [:texture | texture savingID].
		#metallicFactor . metallicFactor.
		#roughnessFactor . roughnessFactor.
		#metallicRoughnessTexture . metallicRoughnessTexture ifNotNil: [:texture | texture savingID].

		#texcoordScale . texcoordScale encodeForJSON.
		#texcoordOffset . texcoordOffset encodeForJSON.
		#texcoordOffsetVelocity . texcoordOffsetVelocity encodeForJSON.
	}
]

{ #category : #initialization }
WEWMetallicRoughnessMaterial >> initialize [
	super initialize.
	
	emissiveFactor := Vector3 zeros.
	baseColorFactor := Vector4 ones.
	occlusionFactor := 1.0.
	roughnessFactor := 1.0.
	metallicFactor := 1.0.
	
	texcoordScale := Vector2 ones.
	texcoordOffset := Vector2 zeros.
	texcoordOffsetVelocity := Vector2 zeros.
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> metallicFactor [

	^ metallicFactor
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> metallicFactor: anObject [

	metallicFactor := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> metallicRoughnessTexture [

	^ metallicRoughnessTexture
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> metallicRoughnessTexture: anObject [

	metallicRoughnessTexture := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> normalTexture [

	^ normalTexture
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> normalTexture: anObject [

	normalTexture := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> occlusionFactor [

	^ occlusionFactor
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> occlusionFactor: anObject [

	occlusionFactor := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> occlusionTexture [

	^ occlusionTexture
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> occlusionTexture: anObject [

	occlusionTexture := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> roughnessFactor [

	^ roughnessFactor
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> roughnessFactor: anObject [

	roughnessFactor := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> texcoordOffset [

	^ texcoordOffset
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> texcoordOffset: anObject [

	texcoordOffset := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> texcoordOffsetVelocity [

	^ texcoordOffsetVelocity
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> texcoordOffsetVelocity: anObject [

	texcoordOffsetVelocity := anObject
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> texcoordScale [

	^ texcoordScale
]

{ #category : #accessing }
WEWMetallicRoughnessMaterial >> texcoordScale: anObject [

	texcoordScale := anObject
]

{ #category : #serialization }
WEWMetallicRoughnessMaterial >> traceForSavingWith: savingContext [
	super traceForSavingWith: savingContext.
	baseColorTexture ifNotNil: [ savingContext trace: baseColorTexture ].
	emissiveTexture ifNotNil: [ savingContext trace: emissiveTexture ].
	metallicRoughnessTexture ifNotNil: [ savingContext trace: metallicRoughnessTexture ].
	normalTexture ifNotNil: [ savingContext trace: normalTexture ].
	occlusionTexture ifNotNil: [ savingContext trace: occlusionTexture ].
]

Class {
	#name : #WEWUnlitMaterial,
	#superclass : #WEWMaterial,
	#instVars : [
		'colorFactor',
		'colorTexture',
		'texcoordScale',
		'texcoordOffset',
		'texcoordOffsetVelocity'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #accessing }
WEWUnlitMaterial >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#colorFactor . colorFactor encodeForJSON.
		#colorTexture . colorTexture ifNotNil: [:texture | texture savingID].
		#texcoordScale . texcoordScale encodeForJSON.
		#texcoordOffset . texcoordOffset encodeForJSON.
		#texcoordOffsetVelocity . texcoordOffsetVelocity encodeForJSON.
	}
]

{ #category : #serialization }
WEWUnlitMaterial >> traceForSavingWith: savingContext [
	super traceForSavingWith: savingContext.
	colorTexture ifNotNil: [ savingContext trace: colorTexture ].
]

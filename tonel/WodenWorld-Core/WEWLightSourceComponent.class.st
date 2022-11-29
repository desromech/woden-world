"
I am a light source component. My parameters are modeled after the glTF 2 KHR_lights_punctual extension https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Khronos/KHR_lights_punctual/README.md
"
Class {
	#name : #WEWLightSourceComponent,
	#superclass : #WEWActorComponent,
	#instVars : [
		'kind',
		'color',
		'intensity',
		'range',
		'castShadows',
		'innerConeAngle',
		'outerConeAngle'
	],
	#category : #'WodenWorld-Core-Model'
}

{ #category : #serialization }
WEWLightSourceComponent class >> actorComponentTypeName [
	^ #LightSource
]

{ #category : #'scene graph' }
WEWLightSourceComponent >> buildDirectionalLightSource [
	^ WDDirectionalLightSource new
		color: color;
		intensity: intensity;
		castShadows: castShadows;
		yourself
]

{ #category : #'game framework' }
WEWLightSourceComponent >> buildGameFrameworkComponent [
	^ WDGFActorLightSourceSceneComponent new
		light: self buildLightSource;
		yourself
]

{ #category : #'scene graph' }
WEWLightSourceComponent >> buildLightSource [
	self isPointLightSource ifTrue: [ ^ self buildPointLightSource ].
	self isSpotLightSource ifTrue: [ ^ self buildSpotLightLightSource ].
	self isDirectionalLightSource ifTrue: [ ^ self buildDirectionalLightSource ].
	self error: 'Unsupported light source kind'
]

{ #category : #'scene graph' }
WEWLightSourceComponent >> buildPointLightSource [
	^ WDPointLightSource new
		color: color;
		intensity: intensity;
		influenceRadius: range;
		castShadows: castShadows;
		yourself
]

{ #category : #'scene graph' }
WEWLightSourceComponent >> buildSpotLightLightSource [
	^ WDSpotLightSource new
		color: color;
		intensity: intensity;
		influenceRadius: range;
		castShadows: castShadows;
		innerCutoff: innerConeAngle;
		outerCutoff: outerConeAngle;
		yourself
]

{ #category : #accessing }
WEWLightSourceComponent >> castShadows [

	^ castShadows
]

{ #category : #accessing }
WEWLightSourceComponent >> castShadows: anObject [

	castShadows := anObject
]

{ #category : #accessing }
WEWLightSourceComponent >> color [

	^ color
]

{ #category : #accessing }
WEWLightSourceComponent >> color: anObject [

	color := anObject
]

{ #category : #accessing }
WEWLightSourceComponent >> encodeJsonKeyValues [
	^ super encodeJsonKeyValues , {
		#kind . kind.
		#color . color.
		#intensity . intensity.
		#range . range.
		#castShadows . castShadows.
		#innerConeAngle . innerConeAngle.
		#outerConeAngle . outerConeAngle.
	}
]

{ #category : #initialization }
WEWLightSourceComponent >> initialize [
	super initialize.
	kind := #point.
	color := Vector3 ones.
	intensity := 1.0.
	range := 0.
	castShadows := false.
	innerConeAngle := 0.
	outerConeAngle := Float pi / 4.0.
]

{ #category : #accessing }
WEWLightSourceComponent >> innerConeAngle [

	^ innerConeAngle
]

{ #category : #accessing }
WEWLightSourceComponent >> innerConeAngle: anObject [

	innerConeAngle := anObject
]

{ #category : #accessing }
WEWLightSourceComponent >> intensity [

	^ intensity
]

{ #category : #accessing }
WEWLightSourceComponent >> intensity: anObject [

	intensity := anObject
]

{ #category : #testing }
WEWLightSourceComponent >> isDirectionalLightSource [
	^ kind = #directional
]

{ #category : #testing }
WEWLightSourceComponent >> isLightSourceComponent [
	^ true
]

{ #category : #testing }
WEWLightSourceComponent >> isPointLightSource [
	^ kind = #point
]

{ #category : #testing }
WEWLightSourceComponent >> isSpotLightSource [
	^ kind = #spot
]

{ #category : #accessing }
WEWLightSourceComponent >> kind [

	^ kind
]

{ #category : #accessing }
WEWLightSourceComponent >> kind: aLightSourceKindName [
	self assert: (#(point spot directional) includes: aLightSourceKindName).
	kind := aLightSourceKindName asSymbol.
]

{ #category : #accessing }
WEWLightSourceComponent >> loadFromJson: jsonData [
	super loadFromJson: jsonData.
	self kind: (jsonData at: 'kind' ifAbsent: [self kind]).
	self intensity: (jsonData at: 'intensity' ifAbsent: [self intensity]).
	self range: (jsonData at: 'range' ifAbsent: [self range]).
	self castShadows: (jsonData at: 'castShadows' ifAbsent: [self castShadows]).
	self innerConeAngle: (jsonData at: 'innerConeAngle' ifAbsent: [self innerConeAngle]).
	self outerConeAngle: (jsonData at: 'outerConeAngle' ifAbsent: [self outerConeAngle]).
	
	jsonData at: 'color' ifPresent: [:found | self color: (Vector3 loadFromJson: found)].
]

{ #category : #accessing }
WEWLightSourceComponent >> outerConeAngle [

	^ outerConeAngle
]

{ #category : #accessing }
WEWLightSourceComponent >> outerConeAngle: anObject [

	outerConeAngle := anObject
]

{ #category : #accessing }
WEWLightSourceComponent >> range [

	^ range
]

{ #category : #accessing }
WEWLightSourceComponent >> range: anObject [

	range := anObject
]

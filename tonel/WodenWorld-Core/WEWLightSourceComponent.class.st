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
WEWLightSourceComponent >> isLightSourceComponent [
	^ true
]

{ #category : #accessing }
WEWLightSourceComponent >> kind [

	^ kind
]

{ #category : #accessing }
WEWLightSourceComponent >> kind: anObject [

	kind := anObject
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

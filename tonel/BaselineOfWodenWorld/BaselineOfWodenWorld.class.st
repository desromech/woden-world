Class {
	#name : #BaselineOfWodenWorld,
	#superclass : #BaselineOf,
	#category : #BaselineOfWodenWorld
}

{ #category : #baselines }
BaselineOfWodenWorld >> baseline: spec [
    <baseline>
	spec for: #'common' do: [
		spec
			baseline: #WodenGameFramework with: [ spec repository: 'github://desromech/woden-core-game-framework' ];
			package: #'WodenWorld-Core' with: [
				spec requires: #( #WodenGameFramework).
			];
			package: #'WodenWorld-Tests' with: [
				spec requires: #( #'WodenWorld-Core').
			];
			package: #'WodenWorld-Examples' with: [
				spec requires: #( #'WodenWorld-Core').
			]
	].
]

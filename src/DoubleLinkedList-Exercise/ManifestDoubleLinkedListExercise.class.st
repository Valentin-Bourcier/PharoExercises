"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestDoubleLinkedListExercise,
	#superclass : #PackageManifest,
	#category : #'DoubleLinkedList-Exercise-Manifest'
}

{ #category : #'code-critics' }
ManifestDoubleLinkedListExercise class >> ruleToDoCollectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CustomDoubleLinkedList #toArray #false)) #'2022-02-20T17:19:04.739+01:00') )
]

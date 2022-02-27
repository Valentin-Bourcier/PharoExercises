"
I generate the part of HTML JavaDoc regarding the instance variable lists for a given class.

Public API and Key Messages

- for: aClass. Where ""aClass"" is the reference of the class to generate the JavaDoc for.    

Example:

Creating the JavaDoc of the lists of instance variables for ""CustomDoubleLinkedList"".
> JavaDocAttributesDocGenerator new for: CustomDoubleLinkedList.

"
Class {
	#name : #JavaDocAttributesDocGenerator,
	#superclass : #Object,
	#category : #'JavaDocGenerator-Exercise'
}

{ #category : #utilities }
JavaDocAttributesDocGenerator >> for: aClass [

	"I generate the part of HTML JavaDoc regarding the instance variable lists for a given class."
	^ String streamContents: [ :s | 
		  s nextPutAll: '<ul>'.
		  aClass instVarNames do: [ :each |
			  s nextPutAll: '<li>'.
			  s nextPutAll: each asString.
			  s nextPutAll: '</li>' ].
		  s nextPutAll: '</ul>' ]
]

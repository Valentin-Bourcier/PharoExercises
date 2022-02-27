"
I generate the part of HTML JavaDoc regarding the methods lists for a given class.

Public API and Key Messages

- for: aClass. Where ""aClass"" is the reference of the class to generate the JavaDoc for.    

Example:

Creating the JavaDoc of the lists of methodes implemented by ""CustomDoubleLinkedList"".
> JavaDocMethodsDocGenerator new for: CustomDoubleLinkedList.

"
Class {
	#name : #JavaDocMethodsDocGenerator,
	#superclass : #Object,
	#category : #'JavaDocGenerator-Exercise'
}

{ #category : #'instance creation' }
JavaDocMethodsDocGenerator >> for: aClass [

	"I generate the part of HTML JavaDoc regarding the methods lists for a given class."
	|indentation|
	indentation := '          '. "Could be specified in arguments."
	^ String streamContents: [ :s | 
		  s nextPutAll: '<ul>'.
		  aClass methodDictionary keysAndValuesDo: [ :k :v | 
			  s nextPutAll: String cr.
			  s nextPutAll: indentation .
			  s nextPutAll: '<li>'.
			  s nextPutAll: '<h3>'.
			  s nextPutAll: k asString.
			  s nextPutAll: '</h3>'.
			  s nextPutAll: '<p>'.
			  s nextPutAll: (v comment ifNil: [ 'Method not commented.' ] ifNotNil: [ v comment asString ]).
			  s nextPutAll: '</p>'.
			  s nextPutAll: '</li>' ].
		  s nextPutAll: '</ul>'.
		  s close ]
]

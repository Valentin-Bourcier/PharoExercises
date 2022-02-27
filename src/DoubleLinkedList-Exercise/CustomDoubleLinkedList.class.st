"
I am a data structure storing objects in a chain of cells linked together in both forward and backward directions:
- From the first element (head) to last element (tail).
- From the last element (tail) to first element (head).

I create, and update the links between newly added cells or freshly removed ones.
I also keep track of the list's size and provide references to its head and tail elements.  

To store the objects, I use the class CustomDoubleLinkedListCell.
"
Class {
	#name : #CustomDoubleLinkedList,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail',
		'size'
	],
	#classInstVars : [
		'head',
		'tail'
	],
	#category : #'DoubleLinkedList-Exercise'
}

{ #category : #accessing }
CustomDoubleLinkedList >> head [
	"I return a reference to the cell at the head (the beginning) of the list, or nil, if the latter is empty." 
	head ifNil: [^ nil].
	head ifNotNil: [ ^ head ].
	
]

{ #category : #initialization }
CustomDoubleLinkedList >> initialize [
	"I initialize the size of the list." 
	size := 0
]

{ #category : #testing }
CustomDoubleLinkedList >> isEmpty [
	"Checks if the list is empty or not. O(1)"
	^ head isNil & tail isNil
]

{ #category : #accessing }
CustomDoubleLinkedList >> size [
	"I give the current size of the list."
	^ size.
]

{ #category : #accessing }
CustomDoubleLinkedList >> tail [
	"I return a reference to the cell at the tail (the end) of the list, or nil, if the latter is empty." 
   tail ifNil: [^ nil].
	tail ifNotNil: [ ^ tail ].
	
]

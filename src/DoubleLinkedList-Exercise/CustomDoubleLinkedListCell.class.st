"
I represent a cell in a linked list. This means that I hold a value and two references, to the previous and the next cell in the list.

Instance variables:
- previous. The reference to the previous cell in the list.
- value. The value I hold.
- next. The reference to the next cell in the list.
"
Class {
	#name : #CustomDoubleLinkedListCell,
	#superclass : #Object,
	#instVars : [
		'previous',
		'value',
		'next'
	],
	#category : #'DoubleLinkedList-Exercise'
}

{ #category : #accessing }
CustomDoubleLinkedListCell >> next [
	^ next
]

{ #category : #accessing }
CustomDoubleLinkedListCell >> next: aNextCell [
	next := aNextCell
]

{ #category : #previous }
CustomDoubleLinkedListCell >> previous [
	^ previous
]

{ #category : #accessing }
CustomDoubleLinkedListCell >> previous: aPreviousCell [
	previous := aPreviousCell 

]

{ #category : #accessing }
CustomDoubleLinkedListCell >> value [
	^ value
]

{ #category : #accessing }
CustomDoubleLinkedListCell >> value: aValue [
	value := aValue
]

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
CustomDoubleLinkedList >> getCellAt: aIndex [
	"Return the cell at the specified index if it exists. O(N/2) -> O(N)"
	|cell maxIndex nbOfItemsFromIndexToTail|
	cell := nil. 
	maxIndex := (self size) - 1.
	nbOfItemsFromIndexToTail := maxIndex - aIndex.
	
	(aIndex < 0) | (aIndex > maxIndex)  
		ifTrue: [ Exception signal: 'Index "' , aIndex printString , '" not existing in the list.' ].
	
	(aIndex > 0) & (aIndex < maxIndex)
		ifTrue: [ 
			aIndex <= nbOfItemsFromIndexToTail 
			ifTrue: [
				cell := head. 
				1 to: aIndex do: [ :i | cell := cell next ]
			]
			ifFalse: [ 
				cell := tail. 
				1 to: nbOfItemsFromIndexToTail do: [ :i | cell := cell previous ]
			]
		].
	aIndex = 0
		ifTrue: [ cell := head ].
	
	aIndex = maxIndex
		ifTrue: [ cell := tail ].
		
	^ cell
]

{ #category : #accessing }
CustomDoubleLinkedList >> getValueAt: aIndex [
	"Return the value of a cell at the specified index, if it exists. O(N/2) -> O(N)"
	^ (self getCellAt: aIndex) value
]

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

{ #category : #modifying }
CustomDoubleLinkedList >> insertHead: aValue [
	"Insert a value at the head of the list. O(1)"
	|cell|
	cell := CustomDoubleLinkedListCell new value: aValue.
	self isEmpty 
		ifTrue: [ tail := cell ]
		ifFalse: [ 
			cell next: head.
			head previous: cell. 
		].
	head := cell	.
	size := size + 1.
]

{ #category : #modifying }
CustomDoubleLinkedList >> insertTail: aValue [
	"Insert a value at the tail of the list. O(1)"
	|cell|
	cell := CustomDoubleLinkedListCell new value: aValue.
	self isEmpty 
		ifTrue: [ head := cell ]
		ifFalse: [ 
			tail next: cell.
			cell previous: tail. 
		].
	tail := cell	.
	size := size + 1.
]

{ #category : #testing }
CustomDoubleLinkedList >> isEmpty [
	"Checks if the list is empty or not. O(1)"
	^ head isNil & tail isNil
]

{ #category : #modifying }
CustomDoubleLinkedList >> removeHead [
	"Remove the first element of the list. O(1)"
	self isEmpty 
		ifTrue: [ Exception signal: 'Error, the list is empty, there is nothing left to remove.' ]
		ifFalse: [
			|cell|
			cell := head.
			head := head next.
			head previous: nil.
			cell next: nil.		
			cell delete.
			size := size - 1.
		].

]

{ #category : #modifying }
CustomDoubleLinkedList >> removeTail [
	"Remove the last element of the list. O(1)"
	self isEmpty 
		ifTrue: [ Exception signal: 'Error, the list is empty, there is nothing left to remove.' ]
		ifFalse: [
			|cell|
			cell := tail.
			tail := tail previous.
			tail next: nil.		
			cell previous: nil.
			cell delete.
			size := size - 1.
		].

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

{ #category : #accessing }
CustomDoubleLinkedList >> toArray [
	"Copy the content of the list to an array. O(N)"
	|array cell|
	cell := head.
	array := Array new: self size.
	1 to: self size do: [ :i | 
		array at: i put: cell value. 
		cell := cell next. ].
	^ array
]

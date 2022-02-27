Class {
	#name : #CustomDoubleLinkedListTest,
	#superclass : #TestCase,
	#category : #'DoubleLinkedList-Exercise'
}

{ #category : #tests }
CustomDoubleLinkedListTest >> testGetCellAt [
	|list cell|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertHead: 1.
	"When"
	cell := list getCellAt: 0.	
	"Then"
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: cell value equals: 1.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testGetCellAtLimits [
	|list cellHead cellTail|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertTail: 1.
	list insertTail: 2.	
	list insertTail: 3.
	"When"
	cellHead := list getCellAt: 0.	
	cellTail := list getCellAt: 2.	
	"Then"
	self assert: list head value equals: 1.
	self assert: list tail value equals: 3.
	self assert: cellHead value equals: 1.
	self assert: cellTail value equals: 3.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testGetCellAtMedian [
	|list cellFromHead cellFromTail|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 3.
	list insertTail: 4.
	"When"
	cellFromHead := list getCellAt: 1.	
	cellFromTail := list getCellAt: 2.	
	"Then"
	self assert: list head value equals: 1.
	self assert: list tail value equals: 4.
	self assert: cellFromHead value equals: 2.
	self assert: cellFromTail value equals: 3.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testGetCellAtOnEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When + Then"
	self should: [list getCellAt: 0] raise: Exception.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testGetCellAtWithIllegalIndex [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When + Then"
	self should: [list getCellAt: -1] raise: Exception.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testGetCellAtWithTooBigIndex [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertHead: 1.
	"When + Then"
	self should: [list getCellAt: 1] raise: Exception.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testGetValueAt [
	|list value|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 3.
	"When"
	value := list getValueAt: 1.	
	"Then"
	self assert: list head value equals: 1.
	self assert: list tail value equals: 3.
	self assert: value equals: 2.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInitialize [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"Then"
	self assert: list head equals: nil.
	self assert: list tail equals: nil.
	self assert: list size equals: 0.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertHead [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertHead: 1.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertHeadInNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertHead: 1.
	list insertHead: 2.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 2.
	self assert: list head value equals: 2.
	self assert: list tail value equals: 1. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertTail [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertTailInNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertTail: 2.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testIsEmpty [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"Then"
	self assert: list isEmpty equals: true.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testToArray [
	|list array|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertTail: 1.
	list insertTail: 2.
	"When"
	 array := list toArray.
	"Then"
	self assert: array equals: #(1 2).
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
]

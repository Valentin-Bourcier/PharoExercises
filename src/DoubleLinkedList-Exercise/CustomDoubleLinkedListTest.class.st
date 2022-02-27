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
CustomDoubleLinkedListTest >> testInsertAfter [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertAfter: list head value: 2.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertAfterAtLimitsIndexes [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 0.
	list insertTail: 2.
	list insertTail: 3.
	list insertAfterIndex: 0 value: 1.
	list insertAfterIndex: 3 value: 4.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 5.
	self assert: list head value equals: 0.
	self assert: list tail value equals: 4. 
	self assert: (list getValueAt: 1) equals: 1.
	self assert: (list getValueAt: 4) equals: 4.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertAfterInNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 4.
	list insertAfter: (list getCellAt: 1) value: 3.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 4.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 4. 
	self assert: (list getValueAt: 2) equals: 3.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertAfterIndex [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertAfterIndex: 0 value: 2.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertAfterIndexInNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 4.
	list insertAfterIndex: 1 value: 3.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 4.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 4. 
	self assert: (list getValueAt: 2) equals: 3.

]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertAfterNil [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When + When"
	self should: [list insertAfter: nil value: 1] raise: Exception.
	
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertBefore [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 2.
	list insertBefore: list head value: 1.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertBeforeAtLimitsIndexes [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 4.
	list insertBeforeIndex: 0 value: 0.
	list insertBeforeIndex: 3 value: 3.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 5.
	self assert: list head value equals: 0.
	self assert: list tail value equals: 4. 
	self assert: (list getValueAt: 1) equals: 1.
	self assert: (list getValueAt: 3) equals: 3.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertBeforeInNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 4.
	list insertBefore: (list getCellAt: 2) value: 3.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 4.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 4. 
	self assert: (list getValueAt: 2) equals: 3.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertBeforeIndex [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 2.
	list insertBeforeIndex: 0 value: 1.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2. 
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertBeforeIndexInNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When"
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 4.
	list insertBeforeIndex: 2 value: 3.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 4.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 4. 
	self assert: (list getValueAt: 2) equals: 3.

]

{ #category : #tests }
CustomDoubleLinkedListTest >> testInsertBeforeNil [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When + When"
	self should: [list insertBefore: nil value: 1] raise: Exception.
	
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
CustomDoubleLinkedListTest >> testRemoveAt [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertHead: 1.
	"When"
	list removeAt: 0.	
	"Then"
	self assert: list isEmpty equals: true.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveAtFromEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When + Then"
	self should: [ list removeAt: 0 ] raise: Exception.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveAtFromNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 3.
	"When"
	list removeAt: 1.
	list removeAt: 1.
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveAtLimitsIndexes [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertHead: 1.
	list insertHead: 2.
	"When"
	list removeAt: 1.
	list removeAt: 0.
	"Then"
	self assert: list isEmpty equals: true.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveAtWithIllegalIndexes [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertHead: 1.
	list insertHead: 2.
	"When + Then"
	self should: [ list removeAt: -1 ] raise: Exception.
	self should: [ list removeAt: 2 ] raise: Exception.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveFromEmptyList [
	|list cell|
	"Given"
	list := CustomDoubleLinkedList new.
	cell := CustomDoubleLinkedListCell new.
	"When + Then"
	self should: [list remove: cell] raise: Exception.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveFromNotEmptyList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertTail: 1.
	list insertTail: 2.
	list insertTail: 3.
	"When"
	list remove: (list getCellAt: 1).
	"Then"
	self assert: list isEmpty equals: false.
	self assert: list size equals: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 3.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveFromOneItemList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertTail: 1.
	"When"
	list remove: list head.
	"Then"
	self assert: list isEmpty equals: true.
	self assert: list size equals: 0.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveNil [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	"When + Then"
	self should: [list remove: nil] raise: Exception.
]

{ #category : #tests }
CustomDoubleLinkedListTest >> testRemoveOneItemList [
	|list|
	"Given"
	list := CustomDoubleLinkedList new.
	list insertHead: 1.
	"When"
	list removeAt: 0.	
	"Then"
	self assert: list isEmpty equals: true.
	self assert: list head equals: nil.
	self assert: list tail equals: nil.
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

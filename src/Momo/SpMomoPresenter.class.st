Class {
	#name : #SpMomoPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'input',
		'list'
	],
	#category : #Momo
}

{ #category : #'instance creation' }
SpMomoPresenter class >> open [
	<script>
	
	self new openWithSpec
]

{ #category : #initialization }
SpMomoPresenter >> execute: text [ 
	
	MpMethodProxy uninstallAllWrappers.
	self installMpForInstanceCreation.
	"[" Smalltalk compiler evaluate: text "] on: Error do: [  ]"
]

{ #category : #initialization }
SpMomoPresenter >> initializePresenters [
	
	super initializePresenters.
	input := self newTextInput
		                    placeholder: 'give an expression to bench';
		                    yourself.
	input whenSubmitDo: [ :text | self execute: text ].
	list := self newList.
	layout := SpBoxLayout newTopToBottom
		add: input ;
		add: list ;
		yourself.
]

{ #category : #initialization }
SpMomoPresenter >> installMpForInstanceCreation [
	
	| h p1 p2 p3 |
	h := MpAllocationProfilerHandler new.
p1 := MpMethodProxy
 onMethod: Behavior >> #basicNew 
 handler: h.
p1 install.
p2 := MpMethodProxy 
 onMethod: Behavior >> #basicNew: 
 handler: h.
p2 install.
p3 := MpMethodProxy 
 onMethod: Array class >> #new: 
 handler: h.
p3 install.
]

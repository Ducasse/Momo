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
SpMomoPresenter >> initializePresenters [
	
	super initializePresenters.
	input := self newTextInput
		                    autoAccept: true;
		                    placeholder: 'give an expression to bench';
		                    yourself.
	list := self newList.
	layout := SpBoxLayout newTopToBottom
		add: input ;
		add: list ;
		yourself.
]

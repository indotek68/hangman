# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

GameApp = angular.module "GameApp", ['ui.bootstrap']

GameApp.controller "gameCtrl", ['$scope', ($scope) ->
	
	$scope.secrets = []
	counter = 0
	hintCounter = 0


	$scope.letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n",'o','p','q','r','s','t','u','v','w','x','y','z']

	$scope.inputWord = ->
		$scope.secrets = $scope.secretWord.split("")
		console.log($scope.secrets)
		$scope.hide = true
		$scope.winner = false
		$scope.showLetter = {}
		$scope.secrets.forEach (letter) ->
			$scope.showLetter[letter] = false
		$scope.showKeys = {}
		$scope.letters.forEach (keys) ->
			$scope.showKeys[keys] = true
		$scope.hangman = {}
		$scope.hint = {}
		$scope.hint[0] = true

	$scope.letterClick = ->
		index = $scope.secrets.indexOf(this.letter)
		count = 0
		if index > -1
			$scope.showLetter[this.letter] = true
			$scope.showKeys[this.letter] = false
			for answer of $scope.showLetter
				if $scope.showLetter[answer] == true
					count++
					if count == Object.keys($scope.showLetter).length
						$scope.winner = true
		else
			# console.log $scope.hangman
			# console "counter "+ counter
			$scope.hangman[counter] = true
			$scope.showKeys[this.letter] = false
			counter++
			if $scope.hangman[5] == true
				$scope.loser = true

	$scope.hintButton = ->
		$scope.hintBox = true
		hintCounter++
		$scope.hint[hintCounter-1] = false
		$scope.hint[hintCounter] = true

	$scope.closeBox = ->
		$scope.hintBox = false

	$scope.resetGame = ->
		$scope.secrets = []
		$scope.winner = false
		$scope.loser = false
		$scope.hide = false
		$scope.secretWord = ""
		counter = 0
		hintCounter = 0

]
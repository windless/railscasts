# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

app = angular.module("Booking", ["ngResource"])

app.factory "Book", ["$resource", ($resource) ->
  $resource("/books/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@BookingCtrl = ["$scope", "Book", ($scope, Book) ->
  $scope.books = Book.query()

  $scope.addBook = ->
    book = Book.save($scope.newBook)
    $scope.books.push(book)
    $scope.newBook = {} 
]

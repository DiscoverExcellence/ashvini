# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.link1').click ->
    x = $(this).attr 'data-id'
    console.log x
   
    $('#yes1').attr("href","/games/" + x)
    return
  return

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.link_match').click ->
    y = $(this).attr 'game-id'
    console.log y
    x = $(this).attr 'data-id'
    console.log x
    z = $(this).attr 'tournament-id'
    console.log z
    $('#yes2').attr("href","/games/"+y+"/matches/"+x)
    $('#yes3').attr("href","/games/"+y+"/tournaments/"+z+"/matches/"+x)
    return
  return

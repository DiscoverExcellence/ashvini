# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.link_player').click ->
    w = $(this).attr 'match-id'
    console.log y
    y = $(this).attr 'game-id'
    console.log w
    x = $(this).attr 'data-id'
    console.log x
    z = $(this).attr 'tournament-id'
    console.log z
    $('#yes3').attr("href","/players/"+ x)
    $('#yes2').attr("href","/games/"+ y +"/matches/"+ w +"/players/"+ x)
    $('#yes1').attr("href","/games/"+ y +"/tournaments/"+ z +"/matches/"+ w +"/players/"+ x)
    return
  return

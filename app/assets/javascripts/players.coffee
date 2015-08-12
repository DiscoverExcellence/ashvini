# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'click', '.link_player', ->
    matchid = $(this).attr 'match-id'
    console.log matchid
    gameid = $(this).attr 'game-id'
    console.log gameid
    playerid = $(this).attr 'data-id'
    console.log playerid
    tournamentid = $(this).attr 'tournament-id'
    console.log tournamentid
    console.log("href","/games/"+gameid+"/matches/"+matchid+"/players/"+ $(this).attr 'data-id')
    $('#yes3').attr("href","/players/"+playerid)
    $('#yes2').attr("href","/games/"+gameid+"/matches/"+matchid+"/players/"+ $(this).attr 'data-id')
    $('#yes1').attr("href","/games/"+gameid+"/tournaments/"+tournamentid+"/matches/"+matchid+"/players/"+ $(this).attr 'data-id')
    return
  return

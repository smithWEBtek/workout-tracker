# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 var url = ""

$(function(){

  // Pull Days from API using AJAX
  $.get(url).success(function(json){
    //debugger
    $("div.all-days").html("")
  })

  e.preventDefault();
})

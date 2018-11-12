// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function(){


  $("a.load_user_workouts").on('click', function(event){

    $.get(this.href).success(function(json){

      var $ol = $("div.workouts ol")
      $ol.html("")
      json.forEach(function(json){
        $ol.append("<li>" + json.name + "</li>");
      })

    })

    event.preventDefault();
  })
})

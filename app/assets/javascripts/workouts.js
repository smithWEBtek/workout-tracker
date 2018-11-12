// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function(){


  $("a.load_user_workouts").on('click', function(event){
    //debugger
    $.get(this.href).success(function(response){
      $("div.workouts").html(response)
    })

    event.preventDefault();
  })
})

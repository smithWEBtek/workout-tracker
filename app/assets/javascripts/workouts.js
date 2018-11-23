// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

//Load workouts
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



//Add new workout
$(function(){

    $("#new_workout").on("submit", function(e){


      url = this.action
      data = {
        'authenticity_token': $("input[name='authenticity_token']").val(),
        'workout':{
          'name':$("#workout_name").val(),
          'day': $("#workout_day").val(),
          'description': $("#workout_description").val()
        }
      };

      $.ajax({
        type: 'POST',
        data: data,
        url: url,
        success: function(response){
          $("#workout_name").val(""),
          $("#workout_day").val(""),
          $("#workout_description").val("")

          var $ol = $("div.user_workouts ol")
          $ol.append(response)

        }
      });

      e.preventDefault();
    })


});

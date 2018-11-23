// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function(){
  $("#new_exercise").on("submit", function(e){
    url = this.action

    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'exercise':{
        'name':$("#exercise_name").val(),
        'sets': $("#exercise_sets").val(),
        'reps': $("#exercise_reps").val(),
        'rest': $("#exercise_rest").val()
      }
    };

    $.ajax({
      type: 'POST',
      data: data,
      url: url,
      success: function(response){
        var $ol = $("div.workout_exercises ol")
        $ol.append(response)
      }
    });


    e.preventDefault();
  })
});

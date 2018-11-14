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
    //debugger;


    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'workout':{
        'name':$("#workout_name").val(),
        'description': $("#workout_description").val(),
        'day': $("#workout_day").val()
      }
    }

    $.ajax({
      type: "POST",
      url: this.action,
      data: data,
      success: function(response){
        $("#workout_name").val("");
        $("#workout_description").val("");
        $("#workout_day").val();

        var $ol = $("div.add-workouts ol")
        $ol.append(response);
      }
    })



      e.preventDefault();
  })
})

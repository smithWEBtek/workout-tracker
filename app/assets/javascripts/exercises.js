// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/






$(function(){

  //ADD EXERCISE
  $("a.add_workout_exercise").on('click', function(e){
    debugger;

    e.preventDefault();
  })







  //DELETE EXERCISE
  $("a.remove-exercise").on('click', function(e){

    $.ajax({
      method: 'DELETE',
      url: 'exercises/api',
    }).success(function(result){
        alert("You deleted exercise")
    });

    e.preventDefault();
  })


  //LOAD EXERCISES

  $("a.load_workout_exercises").on('click', function(event){
    //debugger;

    // $.ajax({
    //   method: 'GET',
    //   url: this.href,
    // }).success(function(data){
    //     $("div.exercises").html(data)
    // });

    $.get(this.href).success(function(response){
      $("div.exercises").html(response)
    })

    event.preventDefault();
  })




})


// $.ajax({
//     url: '/script.cgi',
//     type: 'DELETE',
//     success: function(result) {
//         // Do something with the result
//     }
// });

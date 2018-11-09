// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/




$(function(){

  //ADDING NEW WORKOUT FORM



  //LOAD USER WORKOUTS
  $("a.load_workouts").on('click', function(e){
    // $.get("").sucess(function(){
    //
    //     e.preventDefault();
    // })

     alert('laoded user workouts')
    e.preventDefault();

    })
})


// $("a.load_muscles").on('click', function(e){
//   $.get("https://wger.de/api/v2/muscle/").success(function(json){
//     //clear(empty) muscles ol
//     var $ol = $("div.muscles ol")
//     $ol.html("")
//     //Iterate over json for names, appending LI to Ol
//     //debugger
//     let i = 0
//     var muscle_names = json.results;
//      muscle_names.forEach(function(muscle_name){
//        $ol.append("<li>" + muscle_name.name + "</li>");
//        //debugger
//      })
//
//
//   })
//   e.preventDefault();
// })

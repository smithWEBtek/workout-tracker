// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/
//
// //  var url = "https://wger.de/api/v2/day/";
// //
// // $(function(){
// //
// // $("a.load_days").on('click', function(e){
// //
// //   // Pull Days from API using AJAX
// //   $.get("https://wger.de/api/v2/muscle/").success(function(json){
// //       debugger
// //       $("div.all-days").html("")
// //     })
// //
// //     e.preventDefault();
// //
// //
// // })
//
//
//
//
// $(function () {
//
// 	$("a.load_days").on('click', function (e) {
// 		e.preventDefault();
//
// 		// Pull Days from API using AJAX
// 		$.get(url).success(function (json) {
//
// 			let days = json.results;
// 			console.log('days: ', days);
//
// 			for (object of days) {
// 				let name = object.name
// 				$('#all-days').append(`<li>${name}</li>`)
// 			}
// 		})
// 	})
// });

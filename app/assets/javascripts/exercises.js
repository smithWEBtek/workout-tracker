// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function () {
	$("#new_exercise").on("submit", function (e) {
		e.preventDefault()
		url = this.action

		let data = {
			name: $('#exercise_name').val(),
			sets: $('#exercise_sets').val(),
			reps: $('#exercise_reps').val(),
			rest: $('#exercise_rest').val(),
			workout_id: e.target.elements[3].value
		}

		let token = e.target.elements[2].value

		$.ajax({
			// type: ($("input[name='_method']").val() || this.type),
			type: 'post',
			data: { exercise: data },
			'X-CSRF-Token': token,
			url: url,
			success: function (response) {
				$("#exercise_name").val(""),
					$("#exercise_sets").val(""),
					$("#exercise_reps").val(""),
					$("#exercise_rest").val("")
				var $ol = $("div.workout_exercises ol")
				$ol.append(response)
			}
		});
		e.preventDefault();
	})
});

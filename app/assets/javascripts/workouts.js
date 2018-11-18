$(function () {
	loadWorkouts();
	newWorkout();
})

function loadWorkouts() {
	$("a.load_user_workouts").on('click', function (event) {
		$.get(this.href)
			.then(res => function () {
				let $ol = $("div.workouts ol")
				$ol.html("")
				res.forEach(function (json) {
					$ol.append("<li>" + json.name + "</li>");
				})
			})
		event.preventDefault();
	})
}

function newWorkout() {
	$("#new_workout").on("submit", function (e) {
		data = $(this).serialize()
		$.ajax({
			type: 'post',
			url: this.action,
			data: data,
			success: function (response) {
				$("#workout_name").val("");
				$("#workout_description").val("");
				$("#workout_day").val("");

				var $ol = $("div.add-workouts ol")
				$ol.append(response);
			}
		})
		e.preventDefault();
		loadWorkouts();
	})
}

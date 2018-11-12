# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


workouts = ["chest day", "shoulder blast", "ab crusher", "leg day", "arnold's back"]
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

workouts.each{|workout|
  i=0
  Workout.create(name: workout, day: days[i], description: "I am an awesome workout!")

}


muscles = ["Anterior deltoid", "Biceps brachii", "Biceps femoris", "Brachialis", "Gluteus maximus" ]

muscles.each{|muscle| Muscle.create(name: muscle)}
# Anterior deltoid
# Biceps brachii
# Biceps femoris
# Brachialis
# Gastrocnemius
# Gluteus maximus
# Latissimus dorsi
# Obliquus externus abdominis

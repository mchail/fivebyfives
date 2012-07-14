# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Exercise.create(name: "Squat",
				starting_weight: 45,
				increment: 5,
				rotation: 0
)

Exercise.create(name: "Overhead press",
				starting_weight: 45,
				increment: 5,
				rotation: 1
)

Exercise.create(name: "Deadlift",
				starting_weight: 85,
				increment: 10,
				rotation: 1
)

Exercise.create(name: "Bench",
				starting_weight: 45,
				increment: 5,
				rotation: 2
)

Exercise.create(name: "Pendlay row",
				starting_weight: 45,
				increment: 5,
				rotation: 2
)

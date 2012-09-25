# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.delete_all
puts 'Deleted Projects'
projects = Project.create!([
		{ name: "Rails 4", 			github_repository: "https://github.com/bootstrap/Hello-World" },
		{ name: "Marionnete", 		github_repository: "https://github.com/bootstrap/Hello-World" },
		{ name: "Mustache Planet", 	github_repository: "https://github.com/bootstrap/Hello-World" }
	])
puts 'Projects seeded'

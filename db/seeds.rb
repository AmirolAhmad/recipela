# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Difficulty.find_or_create_by(name: "Very Easy")
Difficulty.find_or_create_by(name: "Easy")
Difficulty.find_or_create_by(name: "Intermediate")
Difficulty.find_or_create_by(name: "Hard")
Difficulty.find_or_create_by(name: "Very Hard")

Category.find_or_create_by(name: "Apetizers")
Category.find_or_create_by(name: "Cocktails")
Category.find_or_create_by(name: "Deserts")
Category.find_or_create_by(name: "Eggs")
Category.find_or_create_by(name: "Events")
Category.find_or_create_by(name: "Fish")
Category.find_or_create_by(name: "Fitness")
Category.find_or_create_by(name: "Healthy")
Category.find_or_create_by(name: "Asian")
Category.find_or_create_by(name: "Mexican")
Category.find_or_create_by(name: "Pizza")
Category.find_or_create_by(name: "Kids")
Category.find_or_create_by(name: "Meat")
Category.find_or_create_by(name: "Snacks")
Category.find_or_create_by(name: "Salads")
Category.find_or_create_by(name: "Storage")
Category.find_or_create_by(name: "Soup")
Category.find_or_create_by(name: "Vegetarian")

Recipe.create_with(
	description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vulputate mi eu neque faucibus interdum. Aliquam in justo congue, mattis diam eget, porta massa. Cras sodales elementum consectetur. Curabitur ullamcorper eu dolor eget tempus. Praesent faucibus pulvinar porta.", 
	difficulty: Difficulty.first,
	category: Category.first,
	user: User.first,
	status: 'draft',
	prep_time: '10',
	serves: '4',
	cooking_time: '45',
	ingredient: 'Onion',
	instruction: 'Everything is ready',
	).find_or_create_by(title: "Default Recipe")

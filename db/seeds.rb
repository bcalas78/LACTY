# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all

red = Category.new(name: "red")
red.save!
orange = Category.new(name: "orange")
orange.save!
green = Category.new(name: "green")
green.save!
white = Category.new(name: "white")
white.save!

product1 = Product.new(name: "Pom'Potes Pomme Nature", description: "Tout est bon dans Pom'Potes Pomme Nature !", composition: "Pomme 99,7% (purée et purée concentrée), arôme naturel de pomme, jus de citron concentré, antioxydant : acide ascorbique.")
product1.category = green
product1.save!

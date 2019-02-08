# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
juan =User.create!(username: "priSeeds", password: "1234", screen_name: "manu", email: "seedsJuanma@gmail.com")
ottone =User.create!(username: "segSeeds", password: "1234", screen_name: "otto", email: "seedsOttone@hotmail.com")
juan.question.create!(title: "primera seeds", description: "creando la primera pregunta del seeds")
juan.question.create!(title: "segundo del seeds", description: "creando otra pregunta para el seeds")
Answer.create!(content: "correcto", user: (User.find_by_email("seedsJuanma@gmail.com")).id, question: 1)
Answer.create!(content: "Messi con 500 goles", user: (User.find_by_email("seedsJuanma@gmail.com")).id, question: 2)

#Fijarse antes de entregar si las correcciones andan + corregir las answers.


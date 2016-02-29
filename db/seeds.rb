# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@example.com",
            password: 12345678, password_confirmation: 12345678)

Project.create(user: User.first, name: "simple_form",
               repository_url: "https://github.com/plataformatec/simple_form.git")

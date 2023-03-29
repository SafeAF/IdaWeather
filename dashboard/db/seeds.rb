# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


u = User.new
u.email = "admin@idaweather.com"
u.password = 'foobar'
u.password_confirmation = 'foobar'
u.save!

s = Study.create(name: "The Winter of '85", 
                 description: "The winter of 1985 was especially cold.")

s2 = Study.create(name: "A Look at Precipitation in the Salmon Dam Watershed",
                  description: "A look at the past 73 years of snowfall and precipitation in the mountains west of Jackpot")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
first_user = User.create!([{
  name:"Ayesha",
  email:"ayesha4567@gmail.com",
  password:"123456",
}])
second_user = User.create!([{
  name:"Zuhra",
  email:"zuhra4567@gmail.com",
  password:"123456",
}])

Recipe.destroy_all

Recipe.create!([{
    user: User.first,
    name: "Apple Pie",
    preparationTime: 1.2,
    cookingTime: 1.0,
    description: "After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.",
    public: true
  },
  {
    user: User.first,
    name: "Lemon Meranigue",
    preparationTime: 1.0,
    cookingTime: 1.5,
    description: "After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.",
    public: true
  },
  {
    user: User.last,
    name: "Purple rice cake",
    preparationTime: 0.5,
    cookingTime: 2.5,
    description: "After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.",
    public: true
  },
  {
    user: User.last,
    name: "Vanilla Cake",
    preparationTime: 2.0,
    cookingTime: 1.0,
    description: "After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.",
    public: true
  }])
  
  p "Created #{Recipe.count} recipes"
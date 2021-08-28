# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@user_1 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
@user_2 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
@user_3 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
@user_4 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
@user_5 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")

@client_1 = Client.create!(email: Faker::Internet.email)
@client_2 = Client.create!(email: Faker::Internet.email)
@client_3 = Client.create!(email: Faker::Internet.email)
@client_4 = Client.create!(email: Faker::Internet.email)
@client_5 = Client.create!(email: Faker::Internet.email)

@review_1 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_1 ,client: @client_1)
@review_2 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_2 ,client: @client_2)
@review_3 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_3 ,client: @client_3)
@review_4 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_4 ,client: @client_4)
@review_5 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_5 ,client: @client_5)
@review_6 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_1 ,client: @client_5)
@review_7 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_2 ,client: @client_4)
@review_8 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_3 ,client: @client_3)
@review_9 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_4 ,client: @client_2)
@review_10 = Review.create!(rating: Faker::Number.between(from: 1, to: 5), body: Faker::Lorem.paragraph, user: @user_5 ,client: @client_1)

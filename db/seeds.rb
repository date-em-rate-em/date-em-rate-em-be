Review.destroy_all
Client.destroy_all
User.destroy_all


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

@review_1 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_1 ,
  client: @client_1,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_2 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_2 ,
  client: @client_2,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_3 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_3 ,
  client: @client_3,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_4 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_4 ,
  client: @client_4,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_5 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_5 ,
  client: @client_5,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_6 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_1 ,
  client: @client_5,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_7 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_2 ,
  client: @client_4,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_8 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_3,
  client: @client_2,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_9 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_4 ,
  client: @client_3,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

@review_10 = Review.create!(
  rating: Faker::Number.between(from: 1, to: 5),
  body: Faker::Lorem.sentence,
  user: @user_5 ,
  client: @client_1,
  size: Faker::Number.between(from: 1, to: 12),
  payment: Faker::Number.between(from: 1, to: 10),
  hygiene: Faker::Number.between(from: 1, to: 10),
  duration: Faker::Number.between(from: 0, to: 24),
  condoms: Faker::Lorem.word,
  punctuality: Faker::Lorem.sentence,
  vibe: Faker::Number.between(from: 1, to: 10),
  date_again: Faker::Lorem.word,
  safety_meter: Faker::Number.between(from: 1, to: 10),
  gender: Faker::Gender.type)

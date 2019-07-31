# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
Service.create!(name: 'amusement park')
Service.create!(name: 'restaurant')
Service.create!(name: 'resort')
Service.create!(name: 'shop')
Service.create!(name: 'shopping mall')
Faker::Config.locale = 'en-US'
# Generate 50 users
50.times do

  temp = if Faker::Number.between(1, 2) == 1
           'Company'
         else
           'Reviewer'
         end
  User.create!(
      role: temp,
      name: Faker::Name.name,
      address: Faker::Address.street_address << Faker::Address.city << Faker::Address.country,
      website: Faker::Internet.url,
      phoneNumber: (Faker::PhoneNumber.exchange_code << '-' << Faker::PhoneNumber.exchange_code << '-' << Faker::PhoneNumber.subscriber_number),
      email: Faker::Internet.email,
      description: Faker::Lorem.paragraph,
      password: '111111',
      password_confirmation: '111111'
    )

end
puts '==================='
# Generate 30 places

companys = []
User.all.each do |user|
  companys.push(user.id) if user.role == 'Company'
end
services = []
Service.all.each do |service|
  services.push(service.id)
end
30.times do
    Place.create(
             user_id: companys.sample,
             address: Faker::Address.street_address.to_s << Faker::Address.city.to_s << Faker::Address.country,
             service_id: services.sample,
             # change after update reviewpaper od user
             numberRatings: 0,
             mediumRating: 0,
             phoneNumber: Faker::PhoneNumber.exchange_code.to_s << '-' << Faker::PhoneNumber.exchange_code.to_s << '-' << Faker::PhoneNumber.subscriber_number,
             timeOpen: Faker::Time.between(2.days.ago, Date.today, :all),
             timeClose: Faker::Time.between(2.days.ago, Date.today, :all),
             description: Faker::Lorem.paragraph
           )
end
# Generate Review 
reviewers = []
User.all.each do |user|
  reviewers.push(user.id) if user.role == 'Reviewer'
end
Place.all.each do |place|
  Review.create(
            user_id: reviewers.sample,
            place_id: place.id,
            rating: Faker::Number.between(1, 5),
            comment: Faker::Lorem.paragraph(10)
          )
end
# Generate photo 
  # generate avatar
User.all.each do |user|
  Photo.create(
           user_id: user.id,
           place_id: nil,
           photo_type: 'Avatar',
           path: Faker::File.dir
         )
  #generate image place
  next unless user.role == 'Company'
  places_of_company = []
  Place.all.each do |place|
    places_of_company.push(place.id) if place.user_id == user.id
  end
  places_of_company.each do |p|
    Photo.create(
        user_id: user.id,
        place_id: p,
        photo_type: 'ImagePlace',
        path: Faker::File.dir
      )
  end

end




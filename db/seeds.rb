# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

descriptions = Array.new

6.times do
  description = Faker::Hipster.paragraph(3)
  descriptions.push(description)
end




donor_profiles = []
donations = []

50.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.state + Faker::Address.zip
    phone_number = Faker::PhoneNumber.phone_number
    description = Faker::Lorem.paragraph(3, true)
    donor_profiles.push({:first_name => first_name, :last_name => last_name, :email => email, :address => address, :phone_number => phone_number, :description => description})
end
    
donor_profiles.each do |donor_profile|
  DonorProfile.create!(donor_profile)
end

causes = ["Women's Health", "Children's Health", "Senior Care"]

@donor_profiles = DonorProfile.all
@donor_profiles.each do |donor_profile|
    20.times do
        date = Time.at(rand * Time.now.to_i)
        amount = Faker::Number.decimal(2)
        cause = causes[rand(0..2)]
        @donation = donor_profile.donations.build({:date_received => date, :amount => amount, :cause => cause})
        @donation.save
    end
end


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
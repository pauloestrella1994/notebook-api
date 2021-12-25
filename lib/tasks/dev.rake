namespace :dev do
  desc "Configure the developer enviroment"
  task setup: :environment do
    puts "Loading data contacts into database"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email,
        birthday: Faker::Date.between(from: 65.years.ago,to: 18.years.ago)
      )
    end
    puts "Success!"

    puts "Loading data kinds into database"

    kinds = %w(Friend Commercial Known)

    kinds.each {|kind| Kind.create!(description: kind)}

    puts "Success!"
  end
end

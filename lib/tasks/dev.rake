namespace :dev do
  desc "Configure the developer enviroment"
  task setup: :environment do
    puts "Loading data kinds into database"

    kinds = %w(Friend Commercial Known)

    kinds.each {|kind| Kind.create!(description: kind)}

    puts "Success!"

    puts "Loading data contacts into database"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email,
        birthday: Faker::Date.between(from: 65.years.ago,to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Success!"

    puts "Loading data phones into database"
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones.create!(
          number:Faker::PhoneNumber.cell_phone
        )
        contact.save!
      end
    end   
    puts "Success!"
  end
end
Registration.destroy_all
Review.destroy_all
Event.destroy_all
Category.destroy_all
Venue.destroy_all
User.destroy_all



admin = User.create!(
  email: "admin@uandes.cl",
  password: "password123",
  password_confirmation: "password123",
  first_name: "Admin",
  last_name: "Uandes",
  role: "admin"
)

student1 = User.create!(
  email: "jperez@uandes.cl",
  password: "password123",
  password_confirmation: "password123",
  first_name: "Juan",
  last_name: "Pérez",
  role: "regular"
)

student2 = User.create!(
  email: "mrojas@uandes.cl",
  password: "password123",
  password_confirmation: "password123",
  first_name: "María",
  last_name: "Rojas",
  role: "regular"
)

student3 = User.create!(
  email: "cgonzalez@uandes.cl",
  password: "password123",
  password_confirmation: "password123",
  first_name: "Carlos",
  last_name: "González",
  role: "regular"
)

student4 = User.create!(
  email: "amartinez@uandes.cl",
  password: "password123",
  password_confirmation: "password123",
  first_name: "Ana",
  last_name: "Martínez",
  role: "regular"
)



talks = Category.create!(name: "Academic Talks", description: "Academic discussions and presentations")
sports = Category.create!(name: "Sports", description: "Sports competitions and recreational activities")
culture = Category.create!(name: "Cultural Events", description: "Cultural and artistic events")
workshops = Category.create!(name: "Workshops", description: "Hands-on learning sessions")
study = Category.create!(name: "Study Groups", description: "Collaborative academic sessions")



main_hall = Venue.create!(name: "Main Auditorium", address: "Uandes Campus", capacity: 300)
sports_center = Venue.create!(name: "Sports Center", address: "Uandes Campus", capacity: 500)
library_room = Venue.create!(name: "Library Room 2", address: "Uandes Library", capacity: 80)
computer_lab = Venue.create!(name: "Computer Lab", address: "Building C, Floor 3", capacity: 40)
conference_room = Venue.create!(name: "Conference Room", address: "Building B, Floor 2", capacity: 50)



event1 = Event.new(
  title: "AI in Education Talk",
  start_date: Time.now + 3.days,
  end_date: Time.now + 3.days + 2.hours,
  max_attendees: 200,
  status: :published,
  category: talks,
  venue: main_hall,
  organizer: admin
)
event1.description = "Discussion about AI impact in modern education."
event1.save!

event2 = Event.new(
  title: "Interfaculty Football Tournament",
  start_date: Time.now + 7.days,
  end_date: Time.now + 7.days + 4.hours,
  max_attendees: 300,
  status: :published,
  category: sports,
  venue: sports_center,
  organizer: admin
)
event2.description = "Sports competition between faculties."
event2.save!

event3 = Event.new(
  title: "Ruby on Rails Workshop",
  start_date: Time.now + 5.days,
  end_date: Time.now + 5.days + 3.hours,
  max_attendees: 30,
  status: :published,
  category: workshops,
  venue: computer_lab,
  organizer: student1
)
event3.description = "Learn Ruby on Rails from scratch in this workshop."
event3.save!

event4 = Event.new(
  title: "Exclusive Networking Dinner",
  start_date: Time.now + 10.days,
  end_date: Time.now + 10.days + 3.hours,
  max_attendees: 3,
  status: :published,
  category: talks,
  venue: conference_room,
  organizer: admin
)
event4.description = "Intimate networking dinner with industry leaders. Very limited spots!"
event4.save!

# Draft event
event5 = Event.new(
  title: "Python Study Group",
  start_date: Time.now + 14.days,
  end_date: Time.now + 14.days + 2.hours,
  max_attendees: 20,
  status: :draft,
  category: study,
  venue: computer_lab,
  organizer: student2
)
event5.description = "Weekly Python study group for beginners."
event5.save!

event6 = Event.new(
  title: "Photography Exhibition",
  start_date: Time.now - 2.days,
  end_date: Time.now - 1.day,
  max_attendees: 100,
  status: :finished,
  category: culture,
  venue: library_room,
  organizer: admin
)
event6.description = "Student cultural exhibition of photography."
event6.save!


event7 = Event.new(
  title: "Cancelled Meetup",
  start_date: Time.now + 7.days,
  end_date: Time.now + 7.days + 2.hours,
  max_attendees: 50,
  status: :cancelled,
  category: culture,
  venue: library_room,
  organizer: student2
)
event7.description = "This event was unfortunately cancelled."
event7.save!



def seed_registration(user:, event:, status:)
  Registration.new.tap do |r|
    r.user = user
    r.event = event
    r.status = status
    r.save!(validate: false)
  end
end


seed_registration(user: student1, event: event1, status: :confirmed)
seed_registration(user: student2, event: event1, status: :confirmed)
seed_registration(user: student3, event: event1, status: :confirmed)


seed_registration(user: student1, event: event2, status: :confirmed)
seed_registration(user: student2, event: event2, status: :confirmed)


seed_registration(user: student2, event: event3, status: :confirmed)
seed_registration(user: student3, event: event3, status: :confirmed)
seed_registration(user: student4, event: event3, status: :confirmed)


seed_registration(user: student1, event: event4, status: :confirmed)
seed_registration(user: student2, event: event4, status: :confirmed)
seed_registration(user: student3, event: event4, status: :confirmed)
seed_registration(user: student4, event: event4, status: :waitlisted)


seed_registration(user: student1, event: event6, status: :confirmed)
seed_registration(user: student2, event: event6, status: :confirmed)

Review.create!(
  user: student1,
  event: event6,
  rating: 5,
  comment: "Amazing cultural event!"
)

Review.create!(
  user: student2,
  event: event6,
  rating: 4,
  comment: "Very inspiring!"
)

puts "✅ Created #{Review.count} reviews"


puts "Credentials:"
puts "   Admin:    admin@uandes.cl / password123"
puts "   Student1: jperez@uandes.cl / password123"
puts "   Student2: mrojas@uandes.cl / password123"
puts "   Student3: cgonzalez@uandes.cl / password123"
puts "   Student4: amartinez@uandes.cl / password123"
puts "=" * 50
puts "Summary:"
puts "   Users: #{User.count}"
puts "   Categories: #{Category.count}"
puts "   Venues: #{Venue.count}"
puts "   Events: #{Event.count}"
puts "   Registrations: #{Registration.count}"
puts "   Reviews: #{Review.count}"

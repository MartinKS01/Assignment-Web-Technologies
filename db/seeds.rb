Registration.destroy_all
Review.destroy_all
Event.destroy_all
Category.destroy_all
Venue.destroy_all
User.destroy_all


admin = User.create!(
  email: "admin@uandes.cl",
  first_name: "Admin",
  last_name: "Uandes",
  role: "admin",
  encrypted_password: "password"
)

student1 = User.create!(
  email: "jperez@uandes.cl",
  first_name: "Juan",
  last_name: "Pérez",
  role: "student",
  encrypted_password: "password"
)

student2 = User.create!(
  email: "mrojas@uandes.cl",
  first_name: "María",
  last_name: "Rojas",
  role: "student",
  encrypted_password: "password"
)


talks = Category.create!(name: "Academic Talks")
sports = Category.create!(name: "Sports")
culture = Category.create!(name: "Cultural Events")


main_hall = Venue.create!(name: "Main Auditorium", address: "Uandes Campus", capacity: 300)
sports_center = Venue.create!(name: "Sports Center", address: "Uandes Campus", capacity: 500)
library_room = Venue.create!(name: "Library Room 2", address: "Uandes Library", capacity: 80)


event1 = Event.create!(
  title: "AI in Education Talk",
  description: "Discussion about AI impact in modern education.",
  start_date: Time.now + 3.days,
  end_date: Time.now + 3.days + 2.hours,
  max_attendees: 200,
  status: :published,
  category: talks,
  venue: main_hall,
  organizer: admin
)

event2 = Event.create!(
  title: "Interfaculty Football Tournament",
  description: "Sports competition between faculties.",
  start_date: Time.now + 7.days,
  end_date: Time.now + 7.days + 4.hours,
  max_attendees: 300,
  status: :published,
  category: sports,
  venue: sports_center,
  organizer: admin
)

event3 = Event.create!(
  title: "Photography Exhibition",
  description: "Student cultural exhibition of photography.",
  start_date: Time.now - 2.days,
  end_date: Time.now - 1.day,
  max_attendees: 100,
  status: :finished,
  category: culture,
  venue: library_room,
  organizer: admin
)


Registration.create!(user: student1, event: event1, status: :confirmed)
Registration.create!(user: student2, event: event1, status: :pending)
Registration.create!(user: student1, event: event2, status: :confirmed)



Review.create!(user: student1, event: event3, rating: 5, comment: "Amazing cultural event!")
Review.create!(user: student2, event: event3, rating: 4, comment: "Very inspiring!")

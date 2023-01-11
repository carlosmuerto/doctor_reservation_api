# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


seeded_user = User.create(
    name: "seeded User",
    email: "user@seeded.com",
    password: "seed123seed"
)

seeded_doctor = Doctor.create(
    name: "Seeded Doctor",
    specialization: "seeding",
    photo: "photoURL",
    user: seeded_user
)

Appointment.create(
    user: seeded_user,
    doctor: seeded_doctor,
    description: "seeded description",
    datetime_of_appointment: 10.days.from_now
)
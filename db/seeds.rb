# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# USERS

User.create(
    name: Rails.application.credentials.admin_user_name.presence || 'admin',
    email: Rails.application.credentials.admin_user_email.presence || 'admin@admin.com',
    password: Rails.application.credentials.admin_user_pass.presence || 'adminpass',
    role: User.roles[1]
)

seeded_user_a = User.create(
    name: "seeded Alice",
    email: "Alice@seeded.com",
    password: "seed123seed"
)

seeded_user_b = User.create(
    name: "seeded Bob",
    email: "Bob@seeded.com",
    password: "seed123seed"
)

seeded_user_c = User.create(
    name: "seeded Charle",
    email: "Charle@seeded.com",
    password: "seed123seed"
)

# DOCTORS

seeded_doctor_a = Doctor.new(
    name: "Dr. Edward George Armstrong",
    specialization: "Allergist",
    user: seeded_user_a
)

seeded_doctor_a.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(1).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_a.save

seeded_doctor_b = Doctor.new(
    name: "Dr. Charles Burton",
    specialization: "Anesthesiologist",
    user: seeded_user_a
)

seeded_doctor_b.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(2).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_b.save

seeded_doctor_c = Doctor.new(
    name: "Dr. Mark Hall",
    specialization: "Pediatrician",
    user: seeded_user_a
)

seeded_doctor_c.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(3).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_c.save

seeded_doctor_d = Doctor.new(
    name: "Dr. Peter Leavitt",
    specialization: "Cardiologist",
    user: seeded_user_b
)

seeded_doctor_d.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(4).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_d.save

seeded_doctor_e = Doctor.new(
    name: "Dr. Jeremy Stone",
    specialization: "Oncologist",
    user: seeded_user_b
)

seeded_doctor_e.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(5).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_e.save

seeded_doctor_f = Doctor.new(
    name: "Dr. Martin Arrowsmith",
    specialization: "Gastroenterologist",
    user: seeded_user_b
)

seeded_doctor_f.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(6).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_f.save

seeded_doctor_g = Doctor.new(
    name: "	Dr. Stephen Maturin",
    specialization: "Obstetrician",
    user: seeded_user_b
)

seeded_doctor_g.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(7).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_g.save

seeded_doctor_h = Doctor.new(
    name: "Dr. Andrew Manson",
    specialization: "Ophthalmologist",
    user: seeded_user_c
)

seeded_doctor_h.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(8).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_h.save

seeded_doctor_i = Doctor.new(
    name: "Dr. Jack Stapleton",
    specialization: "Psychiatrist",
    user: seeded_user_c
)

seeded_doctor_i.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(9).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_i.save

seeded_doctor_j = Doctor.new(
    name: "Dr. Sam Weizak",
    specialization: "Dermatologist",
    user: seeded_user_c
)

seeded_doctor_j.photo.attach(
  io: File.open(Rails.root.join('db', 'seed_img', 'doctor(10).jpg')),
  filename: 'soy.jpeg',
  content_type: 'image/jpeg'
)

seeded_doctor_j.save

# APPOINTMENTS

Appointment.create(
    user: seeded_user_b,
    doctor: seeded_doctor_a,
    description: "Looking information about some allergies",
    datetime_of_appointment: 10.days.from_now
)

Appointment.create(
    user: seeded_user_b,
    doctor: seeded_doctor_b,
    description: "Needs Anesthesia for a surgery",
    datetime_of_appointment: 15.days.from_now
)

Appointment.create(
    user: seeded_user_a,
    doctor: seeded_doctor_h,
    description: "Needs a new pair of glasses",
    datetime_of_appointment: 10.days.from_now
)

Appointment.create(
    user: seeded_user_a,
    doctor: seeded_doctor_e,
    description: "Control Appointment",
    datetime_of_appointment: 15.days.from_now
)

Appointment.create(
    user: seeded_user_c,
    doctor: seeded_doctor_f,
    description: "Has been feeling pain in the stomach",
    datetime_of_appointment: 10.days.from_now
)
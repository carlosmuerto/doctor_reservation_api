# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# USERS

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

seeded_doctor_a = Doctor.create(
    name: "Dr. Edward George Armstrong",
    specialization: "Allergist",
    photo: "photoURL",
    user: seeded_user_a
)

seeded_doctor_b = Doctor.create(
    name: "Dr. Charles Burton",
    specialization: "Anesthesiologist",
    photo: "photoURL",
    user: seeded_user_a
)

seeded_doctor_c = Doctor.create(
    name: "Dr. Mark Hall",
    specialization: "Pediatrician",
    photo: "photoURL",
    user: seeded_user_a
)

seeded_doctor_d = Doctor.create(
    name: "Dr. Peter Leavitt",
    specialization: "Cardiologist",
    photo: "photoURL",
    user: seeded_user_b
)

seeded_doctor_e = Doctor.create(
    name: "Dr. Jeremy Stone",
    specialization: "Oncologist",
    photo: "photoURL",
    user: seeded_user_b
)

seeded_doctor_f = Doctor.create(
    name: "Dr. Martin Arrowsmith",
    specialization: "Gastroenterologist",
    photo: "photoURL",
    user: seeded_user_b
)

seeded_doctor_g = Doctor.create(
    name: "	Dr. Stephen Maturin",
    specialization: "Obstetrician",
    photo: "photoURL",
    user: seeded_user_b
)

seeded_doctor_h = Doctor.create(
    name: "Dr. Andrew Manson",
    specialization: "Ophthalmologist",
    photo: "photoURL",
    user: seeded_user_c
)

seeded_doctor_i = Doctor.create(
    name: "Dr. Jack Stapleton",
    specialization: "Psychiatrist",
    photo: "photoURL",
    user: seeded_user_c
)

seeded_doctor_j = Doctor.create(
    name: "Dr. Sam Weizak",
    specialization: "Dermatologist",
    photo: "photoURL",
    user: seeded_user_c
)

# APPOINTMENTS

Appointment.create(
    user: seeded_user_b,
    doctor: seeded_doctor_a,
    description: "seeded description",
    datetime_of_appointment: 10.days.from_now
)

Appointment.create(
    user: seeded_user_b,
    doctor: seeded_doctor_b,
    description: "seeded description",
    datetime_of_appointment: 15.days.from_now
)

Appointment.create(
    user: seeded_user_a,
    doctor: seeded_doctor_h,
    description: "seeded description",
    datetime_of_appointment: 10.days.from_now
)

Appointment.create(
    user: seeded_user_a,
    doctor: seeded_doctor_e,
    description: "seeded description",
    datetime_of_appointment: 15.days.from_now
)

Appointment.create(
    user: seeded_user_c,
    doctor: seeded_doctor_f,
    description: "seeded description",
    datetime_of_appointment: 10.days.from_now
)
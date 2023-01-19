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
    photo: "https://t3.ftcdn.net/jpg/02/95/51/80/360_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg",
    user: seeded_user_a
)

seeded_doctor_b = Doctor.create(
    name: "Dr. Charles Burton",
    specialization: "Anesthesiologist",
    photo: "https://www.eatthis.com/wp-content/uploads/sites/4/2020/12/serious-doctor-hospital.jpg?quality=82&strip=1",
    user: seeded_user_a
)

seeded_doctor_c = Doctor.create(
    name: "Dr. Mark Hall",
    specialization: "Pediatrician",
    photo: "https://st.depositphotos.com/1258191/3252/i/600/depositphotos_32524605-stock-photo-portrait-of-a-handsome-doctor.jpg",
    user: seeded_user_a
)

seeded_doctor_d = Doctor.create(
    name: "Dr. Peter Leavitt",
    specialization: "Cardiologist",
    photo: "https://t4.ftcdn.net/jpg/03/16/76/11/360_F_316761139_yVmLRT0AVwpZwOTgpmfrdIKrtFfg0bop.jpg",
    user: seeded_user_b
)

seeded_doctor_e = Doctor.create(
    name: "Dr. Jeremy Stone",
    specialization: "Oncologist",
    photo: "https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
    user: seeded_user_b
)

seeded_doctor_f = Doctor.create(
    name: "Dr. Martin Arrowsmith",
    specialization: "Gastroenterologist",
    photo: "https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=",
    user: seeded_user_b
)

seeded_doctor_g = Doctor.create(
    name: "	Dr. Stephen Maturin",
    specialization: "Obstetrician",
    photo: "https://img.freepik.com/free-photo/attractive-young-male-nutriologist-lab-coat-smiling-against-white-background_662251-2960.jpg?w=2000",
    user: seeded_user_b
)

seeded_doctor_h = Doctor.create(
    name: "Dr. Andrew Manson",
    specialization: "Ophthalmologist",
    photo: "https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg",
    user: seeded_user_c
)

seeded_doctor_i = Doctor.create(
    name: "Dr. Jack Stapleton",
    specialization: "Psychiatrist",
    photo: "https://familydoctor.org/wp-content/uploads/2018/02/41808433_l.jpg",
    user: seeded_user_c
)

seeded_doctor_j = Doctor.create(
    name: "Dr. Sam Weizak",
    specialization: "Dermatologist",
    photo: "https://st2.depositphotos.com/4431055/11852/i/600/depositphotos_118522306-stock-photo-handsome-doctor-portrait.jpg",
    user: seeded_user_c
)

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
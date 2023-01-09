class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :description
      t.date :date_of_appointment
      t.string :time_of_appointment

      t.timestamps
    end
  end
end

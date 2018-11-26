class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.string :status
      t.references :teacher, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name 
      t.string :last_name
      t.text :design_description
      t.string :location
      t.integer :price
      t.date :appt_date
      t.time :appt_time 
      t.integer :phone_number
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end

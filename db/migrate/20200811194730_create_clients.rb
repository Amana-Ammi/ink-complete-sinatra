class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name 
      t.sting :last_name
      t.text :design_description
      t.string :location
      t.integer :price
      t.date :appt_date
      t.time :appt_time 
      t.ineger :phone_number
      belong_to :user
      t.timestamps null: false
    end
  end
end

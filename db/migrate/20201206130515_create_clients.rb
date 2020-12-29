class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :mobile, null: false
      t.string :password_digest, null: false
      t.string :primary_address, null: false
      t.string :location, null: true
      t.string :longitude, null: true
      t.string :latitude, null: true
      t.string :area, null: true
      t.string :neighborhood, null: true
      t.string :street, null: true
      t.string :secondary_address, null: true
      t.string :building_number, null: true

      t.timestamps
    end
  end
end

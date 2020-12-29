class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :mobile, null: false
      t.string :password_digest, null: false
      t.string :primary_address, null: false
      t.string :location, null: true
      t.string :longitude, null: true
      t.string :latitude, null: true
    end
  end
end

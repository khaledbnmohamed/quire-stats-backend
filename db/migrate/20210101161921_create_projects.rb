class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :quire_id
      t.string :quire_oid

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :quire_id
      t.string :quire_oid
      t.datetime :due
      t.datetime :toggled_at
      t.string :assgine_name
      t.string :assigne_id
      t.string :state
      t.boolean :recurring

      t.timestamps
    end
  end
end

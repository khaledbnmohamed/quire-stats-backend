class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :quire_id
      t.string :quire_oid
      t.date :due
      t.date :toggled_at
      t.string :assgine_name
      t.string :assigne_id
      t.string :state
      t.boolean :recurring

      t.timestamps
    end
  end
end

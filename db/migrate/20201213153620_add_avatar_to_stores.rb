class AddAvatarToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :avatar, :string
  end
end

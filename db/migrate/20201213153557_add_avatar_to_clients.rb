class AddAvatarToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :avatar, :string
  end
end

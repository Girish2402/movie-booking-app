class AddAdminFlagToUser < ActiveRecord::Migration[6.0]
  def self.up
    add_column :users, :is_admin, :boolean, default: false
  end
  def self.down
    remove_column :users, :is_admin
  end
end

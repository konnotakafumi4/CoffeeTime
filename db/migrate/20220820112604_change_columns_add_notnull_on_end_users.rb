class ChangeColumnsAddNotnullOnEndUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :end_users, :name, :string, null: false
  end
end

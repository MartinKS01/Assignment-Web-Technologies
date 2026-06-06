class FixRoleDefaultOnUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_default :users, :role, from: nil, to: "regular"
    change_column_null :users, :role, false, "regular"
  end
end
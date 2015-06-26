class RemoveLastNameToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :AddLast_NameToUsers, :string
  end
end

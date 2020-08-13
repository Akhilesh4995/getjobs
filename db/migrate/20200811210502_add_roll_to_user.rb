class AddRollToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :roll, :string, limit: 20
  end
end

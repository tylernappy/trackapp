class AddNameToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :name, :string
  end
end

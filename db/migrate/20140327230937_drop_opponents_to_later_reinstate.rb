class DropOpponentsToLaterReinstate < ActiveRecord::Migration
  def change
    drop_table :opponents
  end
end

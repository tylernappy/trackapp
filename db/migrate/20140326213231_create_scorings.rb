class CreateScorings < ActiveRecord::Migration
  def change
    create_table :scorings do |t|

      t.timestamps
    end
  end
end

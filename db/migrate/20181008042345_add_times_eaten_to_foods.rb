class AddTimesEatenToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :times_eaten, :int, default: 0
  end
end

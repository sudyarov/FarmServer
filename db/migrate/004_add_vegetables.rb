class AddVegetables < ActiveRecord::Migration
  def self.up
    Vegetable.create(
      :type_id => 1,
      :row => 0,
      :column => 0,
      :stage => 1
    )
    Vegetable.create(
      :type_id => 2,
      :row => 1,
      :column => 0,
      :stage => 3
    )
    Vegetable.create(
      :type_id => 3,
      :row => 2,
      :column => 0,
      :stage => 5
    )
    Vegetable.create(
      :type_id => 3,
      :row => 1,
      :column => 1,
      :stage => 2
    )
    Vegetable.create(
      :type_id => 2,
      :row => 2,
      :column => 1,
      :stage => 5
    )
  end

  def self.down
  end
end

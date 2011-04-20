class AddVegetables < ActiveRecord::Migration
  def self.up
    Vegetable.create(
      :type_id => 1,
      :x => 0,
      :y => 0,
      :stage => 1
    )
    Vegetable.create(
      :type_id => 2,
      :x => 0,
      :y => 5,
      :stage => 3
    )
    Vegetable.create(
      :type_id => 3,
      :x => 0,
      :y => 10,
      :stage => 5
    )
    Vegetable.create(
      :type_id => 3,
      :x => 5,
      :y => 5,
      :stage => 2
    )
    Vegetable.create(
      :type_id => 2,
      :x => 5,
      :y => 10,
      :stage => 5
    )
  end

  def self.down
  end
end

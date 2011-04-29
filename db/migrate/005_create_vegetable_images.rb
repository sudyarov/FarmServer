class CreateVegetableImages < ActiveRecord::Migration
  def self.up
    create_table :vegetable_images do |t|
      t.column :type_id, :int
      t.column :stage, :int
      t.column :url, :string
      #t.timestamps
    end
  end

  def self.down
    drop_table :vegetable_images
  end
end

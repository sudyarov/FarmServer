class CreateVegetables < ActiveRecord::Migration
  def self.up
    create_table :vegetables do |t|
      t.column :type_id, :int
      t.column :row, :int
      t.column :column, :int
      t.column :stage, :int
      #t.timestamps
    end
  end

  def self.down
    drop_table :vegetables
  end
end

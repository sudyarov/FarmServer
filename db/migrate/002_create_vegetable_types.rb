class CreateVegetableTypes < ActiveRecord::Migration
  def self.up
    create_table :vegetable_types do |t|
      t.column :vtype, :string
      #t.timestamps
    end
  end

  def self.down
    drop_table :vegetable_types
  end
end

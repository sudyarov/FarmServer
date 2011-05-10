class CreateFieldParameters < ActiveRecord::Migration
  def self.up
    create_table :field_parameters do |t|
      t.column :param_name, :string
      t.column :param_value, :string
      #t.timestamps
    end
  end

  def self.down
    drop_table :field_parameters
  end
end

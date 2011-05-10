class AddFieldParameters < ActiveRecord::Migration
  def self.up
    FieldParameter.create(
      :param_name => "row_count",
      :param_value => "11"
    )
    FieldParameter.create(
      :param_name => "col_count",
      :param_value => "11"
    )
  end

  def self.down
  end
end

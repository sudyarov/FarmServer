class AddVegetableTypes < ActiveRecord::Migration
  def self.up
    VegetableType.create(:vtype => 'clover')
    VegetableType.create(:vtype => 'sunflower')
    VegetableType.create(:vtype => 'potato')
  end

  def self.down
  end
end

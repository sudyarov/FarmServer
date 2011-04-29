class AddVegetableImages < ActiveRecord::Migration
  def self.up
    #clover
    VegetableImage.create(
      :type_id => 1,
      :stage => 1,
      :url => "public/images/clover/Image 1.png"
    )
    VegetableImage.create(
      :type_id => 1,
      :stage => 2,
      :url => "public/images/clover/Image 3.png"
    )
    VegetableImage.create(
      :type_id => 1,
      :stage => 3,
      :url => "public/images/clover/Image 5.png"
    )
    VegetableImage.create(
      :type_id => 1,
      :stage => 4,
      :url => "public/images/clover/Image 7.png"
    )
    VegetableImage.create(
      :type_id => 1,
      :stage => 5,
      :url => "public/images/clover/Image 9.png"
    )
    
    #sunflower
    VegetableImage.create(
      :type_id => 2,
      :stage => 1,
      :url => "public/images/sunflower/Image 1.png"
    )
    VegetableImage.create(
      :type_id => 2,
      :stage => 2,
      :url => "public/images/sunflower/Image 3.png"
    )
    VegetableImage.create(
      :type_id => 2,
      :stage => 3,
      :url => "public/images/sunflower/Image 5.png"
    )
    VegetableImage.create(
      :type_id => 2,
      :stage => 4,
      :url => "public/images/sunflower/Image 7.png"
    )
    VegetableImage.create(
      :type_id => 2,
      :stage => 5,
      :url => "public/images/sunflower/Image 9.png"
    )
    
    #potato
    VegetableImage.create(
      :type_id => 3,
      :stage => 1,
      :url => "public/images/potato/Image 1.png"
    )
    VegetableImage.create(
      :type_id => 3,
      :stage => 2,
      :url => "public/images/potato/Image 3.png"
    )
    VegetableImage.create(
      :type_id => 3,
      :stage => 3,
      :url => "public/images/potato/Image 5.png"
    )
    VegetableImage.create(
      :type_id => 3,
      :stage => 4,
      :url => "public/images/potato/Image 7.png"
    )
    VegetableImage.create(
      :type_id => 3,
      :stage => 5,
      :url => "public/images/potato/Image 10.png"
    )
  end

  def self.down
  end
end

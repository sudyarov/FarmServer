# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 8) do

  create_table "field_parameters", :force => true do |t|
    t.string "param_name"
    t.string "param_value"
  end

  create_table "vegetable_images", :force => true do |t|
    t.integer "type_id"
    t.integer "stage"
    t.string  "url"
  end

  create_table "vegetable_types", :force => true do |t|
    t.string "vtype"
  end

  create_table "vegetables", :force => true do |t|
    t.integer "type_id"
    t.integer "row"
    t.integer "column"
    t.integer "stage"
  end

end

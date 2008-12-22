# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081222030904) do

  create_table "eve_alliances", :force => true do |t|
    t.string   "name"
    t.string   "shortName"
    t.integer  "executor_corp_id"
    t.integer  "member_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_centrals", :force => true do |t|
    t.integer  "order_id"
    t.integer  "region_id"
    t.integer  "system_id"
    t.integer  "station_id"
    t.integer  "type_id"
    t.boolean  "bid"
    t.float    "price"
    t.integer  "minvolume"
    t.integer  "volremain"
    t.integer  "volenter"
    t.integer  "duration"
    t.integer  "range"
    t.datetime "reported_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eve_centrals", ["type_id"], :name => "type_id"

  create_table "eve_constellations", :force => true do |t|
    t.integer "region_id"
    t.string  "name",       :limit => 100
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "xMin"
    t.float   "xMax"
    t.float   "yMin"
    t.float   "yMax"
    t.float   "zMin"
    t.float   "zMax"
    t.integer "faction_id"
    t.float   "radius"
  end

  add_index "eve_constellations", ["id", "faction_id"], :name => "id", :unique => true
  add_index "eve_constellations", ["faction_id"], :name => "mapConstellations_IX_region"
  add_index "eve_constellations", ["faction_id"], :name => "factionID"

  create_table "eve_regions", :force => true do |t|
    t.string  "name",       :limit => 100
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "xMin"
    t.float   "xMax"
    t.float   "yMin"
    t.float   "yMax"
    t.float   "zMin"
    t.float   "zMax"
    t.integer "faction_id"
    t.float   "radius"
    t.integer "important"
  end

  add_index "eve_regions", ["faction_id"], :name => "factionID"

  create_table "eve_sovereignties", :force => true do |t|
    t.integer  "system_id"
    t.integer  "alliance_id"
    t.boolean  "constellation_sov"
    t.integer  "sov_level"
    t.integer  "faction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_system_jumps", :id => false, :force => true do |t|
    t.integer "fromRegionID"
    t.integer "fromConstellationID"
    t.integer "fromSolarSystemID",   :null => false
    t.integer "toSolarSystemID",     :null => false
    t.integer "toConstellationID"
    t.integer "toRegionID"
  end

  add_index "eve_system_jumps", ["fromConstellationID"], :name => "mapSolarSystemJumps_IX_fromConstellation"
  add_index "eve_system_jumps", ["fromRegionID"], :name => "mapSolarSystemJumps_IX_fromRegion"
  add_index "eve_system_jumps", ["fromSolarSystemID", "fromConstellationID", "fromRegionID"], :name => "fromSolarSystemID"
  add_index "eve_system_jumps", ["toSolarSystemID", "toConstellationID", "toRegionID"], :name => "toSolarSystemID"

  create_table "eve_systems", :force => true do |t|
    t.integer "region_id"
    t.integer "constellation_id"
    t.string  "name",             :limit => 100
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "xMin"
    t.float   "xMax"
    t.float   "yMin"
    t.float   "yMax"
    t.float   "zMin"
    t.float   "zMax"
    t.float   "luminosity"
    t.boolean "border"
    t.boolean "fringe"
    t.boolean "corridor"
    t.boolean "hub"
    t.boolean "international"
    t.boolean "regional"
    t.boolean "constellation"
    t.float   "security"
    t.integer "faction_id"
    t.float   "radius"
    t.integer "sunTypeID",        :limit => 2
    t.string  "securityClass",    :limit => 2
  end

  add_index "eve_systems", ["id", "constellation_id", "region_id"], :name => "id", :unique => true
  add_index "eve_systems", ["constellation_id"], :name => "mapSolarSystems_IX_constellation"
  add_index "eve_systems", ["region_id"], :name => "mapSolarSystems_IX_region"
  add_index "eve_systems", ["security"], :name => "mapSolarSystems_IX_security"
  add_index "eve_systems", ["faction_id"], :name => "factionID"
  add_index "eve_systems", ["sunTypeID"], :name => "sunTypeID"

  create_table "eve_types", :force => true do |t|
    t.integer "group_id",            :limit => 2
    t.string  "name",                :limit => 100
    t.string  "description",         :limit => 3000
    t.integer "graphic_id",          :limit => 2
    t.float   "radius"
    t.float   "mass"
    t.float   "volume"
    t.float   "capacity"
    t.integer "portionSize"
    t.integer "race_id",             :limit => 1
    t.float   "basePrice"
    t.boolean "published"
    t.integer "market_group_id",     :limit => 2
    t.float   "chanceOfDuplicating"
  end

  add_index "eve_types", ["group_id"], :name => "eve_types_IX_Group"
  add_index "eve_types", ["graphic_id"], :name => "graphicID"
  add_index "eve_types", ["race_id"], :name => "raceID"
  add_index "eve_types", ["market_group_id"], :name => "marketGroupID"

  create_table "invTypes", :force => true do |t|
    t.integer "group_id",            :limit => 2
    t.string  "name",                :limit => 100
    t.string  "description",         :limit => 3000
    t.integer "graphic_id",          :limit => 2
    t.float   "radius"
    t.float   "mass"
    t.float   "volume"
    t.float   "capacity"
    t.integer "portionSize"
    t.integer "race_id",             :limit => 1
    t.float   "basePrice"
    t.boolean "published"
    t.integer "market_group_id",     :limit => 2
    t.float   "chanceOfDuplicating"
  end

  add_index "invTypes", ["group_id"], :name => "invTypes_IX_Group"
  add_index "invTypes", ["graphic_id"], :name => "graphicID"
  add_index "invTypes", ["race_id"], :name => "raceID"
  add_index "invTypes", ["market_group_id"], :name => "marketGroupID"

end

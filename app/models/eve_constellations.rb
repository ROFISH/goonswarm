class EveConstellations < ActiveRecord::Base
  belongs_to :region, :foreign_key=>:region_id,:class_name=>"EveRegion"
end

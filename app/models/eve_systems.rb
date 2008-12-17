class EveSystems < ActiveRecord::Base
  has_one :sovereignty, :foreign_key=>:system_id
  belongs_to :region, :foreign_key=>:region_id,:class_name=>"EveRegion"
  belongs_to :constellation, :foreign_key=>:constellation_id,:class_name=>"EveConstellations"
end

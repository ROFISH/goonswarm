class EveSovereignty < ActiveRecord::Base
  belongs_to :system, :foreign_key=>:system_id,:class_name=>"EveSystems"
  belongs_to :alliance, :foreign_key=>:alliance_id,:class_name=>"EveAlliance"
end

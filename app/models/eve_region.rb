class EveRegion < ActiveRecord::Base
  has_many :systems, :class_name=>"EveSystems"
end

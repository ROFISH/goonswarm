class EveAlliance < ActiveRecord::Base
  has_many :sovereignties, :foreign_key=>:alliance_id,:class_name=>"EveSovereignty"
  has_many :systems, :through=>:sovereignties
end

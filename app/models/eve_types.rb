class EveTypes < ActiveRecord::Base
  has_many :max_buy_prices, :foreign_key=>:type_id, :class_name=>"EveCentral", :conditions=>"`eve_centrals`.`bid` = '1'", :limit=>3, :order=>"`eve_centrals`.`price` DESC",:include=>:station
  has_many :min_sell_prices, :foreign_key=>:type_id, :class_name=>"EveCentral", :conditions=>"`eve_centrals`.`bid` = '0'", :limit=>3, :order=>"`eve_centrals`.`price` ASC",:include=>:station
end

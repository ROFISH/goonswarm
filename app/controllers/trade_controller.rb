class TradeController < ApplicationController
  
  def index
    orderedids = ActiveRecord::Base.connection.execute("SELECT type_id FROM `eve_centrals` e1
      INNER JOIN `eve_types` ei ON e1.type_id = ei.id
      WHERE `bid` = 1
      group by type_id
      order by ((SELECT MAX(price) FROM `eve_centrals` e2 INNER JOIN `eve_systems` es ON e2.system_id = es.id && es.security >=.50  WHERE e2.type_id=e1.type_id && e2.bid = 1) - (SELECT MIN(price) FROM `eve_centrals` e2 INNER JOIN `eve_systems` es ON e2.system_id = es.id && es.security >=.50  WHERE e2.type_id=e1.type_id && e2.bid = 0))/ei.volume DESC LIMIT 30").all_hashes.map{|x| x['type_id']}
    
    #order hack because fuck rails
    @types = EveTypes.find(orderedids,:order=>"field(id,#{orderedids.join(',')})")
    #render :text=>types.map{|x| x.max_buy_prices}.inspect
  end
  
  def dump
    if request.post?
      EveCentral.new_dump params['dump']['file'].path
    end
  end
end

class CreateEveCentrals < ActiveRecord::Migration
  def self.up
    create_table :eve_centrals do |t|
      t.column :order_id, :integer
      t.column :region_id, :integer
      t.column :system_id, :integer
      t.column :station_id, :integer
      t.column :type_id, :integer
      t.column :bid, :boolean
      t.column :price, :double
      t.column :minvolume, :integer
      t.column :volremain, :integer
      t.column :volenter, :integer
      t.column :duration, :integer
      t.column :range, :integer
      t.column :reported_time, :datetime
      t.timestamps
    end
    add_index :eve_centrals, :type_id
  end

  def self.down
    drop_table :eve_centrals
  end
end


#5200000000
#864999999
#SELECT type_id,
#   (SELECT MAX(price) FROM `eve_centrals` e2 WHERE e2.type_id=e1.type_id && e2.bid = 1) AS `max_buy_price`,
#   (SELECT MIN(price) FROM `eve_centrals` e2 WHERE e2.type_id=e1.type_id && e2.bid = 0) AS `min_sell_price`,
#   (SELECT MAX(price) FROM `eve_centrals` e2 WHERE e2.type_id=e1.type_id && e2.bid = 1) - (SELECT MIN(price) FROM `eve_centrals` e2 WHERE e2.type_id=e1.type_id && e2.bid = 0) AS `difference`
#
# FROM `eve_centrals` e1
# WHERE `bid` = 1
#group by type_id
#order by difference DESC
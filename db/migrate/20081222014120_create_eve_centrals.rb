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
  end

  def self.down
    drop_table :eve_centrals
  end
end

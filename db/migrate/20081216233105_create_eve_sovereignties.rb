class CreateEveSovereignties < ActiveRecord::Migration
  def self.up
    create_table :eve_sovereignties do |t|
      t.column :system_id, :integer
      t.column :alliance_id, :integer
      t.column :constellation_sov, :boolean
      t.column :sov_level, :integer
      t.column :faction_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :eve_sovereignties
  end
end

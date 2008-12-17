class CreateEveAlliances < ActiveRecord::Migration
  def self.up
    create_table :eve_alliances do |t|
      t.column :name,:string
      t.column :shortName,:string
      t.column :executor_corp_id,:integer
      t.column :member_count,:integer
      t.timestamps
    end
  end

  def self.down
    drop_table :eve_alliances
  end
end

require 'faster_csv'

class EveCentral < ActiveRecord::Base
  
  belongs_to :station,:class_name=>"EveStations"
  belongs_to :system,:class_name=>"EveSystems"
  
  def self.new_dump(dumpfile)
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE `eve_centrals`")
    f = FasterCSV.open(dumpfile)
    a = []
    while !f.eof?
      a<<EveCentral.process_dump_file(f.readline)
      if a.length > 10000
        ActiveRecord::Base.connection.execute("INSERT INTO `eve_centrals` (`order_id` ,`region_id` ,`system_id` ,`station_id` ,`type_id` ,`bid` ,`price` ,`minvolume` ,`volremain` ,`volenter` ,`created_at`,`duration` ,`range` ,`reported_time`) VALUES "+a.join(','))
        p a.last
        a.clear
      end
    end
    true
  end
  
  #   0                 1             2            3            4        5        6               7      8      9                10                   11                12        13           14
  #["909216912 ", " 10000016 ", " 30001381 ", " 60002884 ", " 12042 ", " 1 ", " 15600000.01 ", " 1 ", " 4 ", " 10 ", " 2008-12-20 00:00:00.00 ", " 90:00:00:00.00 ", " 32767 ", " 0 ", " 2008-12-21 01:53:32.80 ", nil]
  def self.process_dump_file(row)
    "('#{row[0]}','#{row[1]}','#{row[2]}','#{row[3]}','#{row[4]}','#{row[5]}','#{row[6]}','#{row[7]}','#{row[8]}','#{row[9]}','#{Time.parse(row[10]).to_formatted_s(:db)}','#{row[11].to_i.days}','#{row[12]}','#{Time.parse(row[14]).to_formatted_s(:db)}')"
  end
end

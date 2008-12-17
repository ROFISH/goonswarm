class ExplorationController < ApplicationController
  
  def index
    @alliance = EveAlliance.find_by_shortName("OHGOD")
    @systems = @alliance.systems.find(:all,:order=>"`eve_regions`.`important` DESC,`eve_systems`.`region_id`,`eve_systems`.`constellation_id` ASC",:include=>{:constellation=>:region},:readonly=>true)
  end
  
  def sov_update
    if request.post?
      doc = REXML::Document.new(params['sov']['file'])
      #titles = []
      EveSovereignty.delete_all
      doc.elements.each('eveapi/result/rowset/row') do |ele|
        EveSovereignty.new(:system_id=>ele.attributes['solarSystemID'],:alliance_id=>ele.attributes['allianceID'],:constellation_sov=>ele.attributes['constellationSovereignty'],:sov_level=>ele.attributes['sovereigntyLevel'],:faction_id=>ele.attributes['factionID']).save
      end
    end
  end
  
  def alliance_update
    if request.post?
      doc = REXML::Document.new(params['alliance']['file'])
      #titles = []
      EveAlliance.delete_all
      doc.elements.each('eveapi/result/rowset/row') do |ele|
        all = EveAlliance.new(:name=>ele.attributes['name'],:shortName=>ele.attributes['shortName'],:executor_corp_id=>ele.attributes['executorCorpID'],:member_count=>ele.attributes['memberCount'],:created_at=>ele.attributes['startDate'])
        #damn rails won't let me mass-update the id
        all.id = ele.attributes['allianceID']
        all.save
      end
    end
  end
end

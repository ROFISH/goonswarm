class TradeController < ApplicationController
  
  def index
    render :text=>"index"
  end
  
  def dump
    if request.post?
      EveCentral.new_dump params['dump']['file'].path
    end
  end
end

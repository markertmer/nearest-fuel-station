class SearchController < ApplicationController

  def index
    # binding.pry
    @station = StationFacade.get_info(params[:location])
  end
end

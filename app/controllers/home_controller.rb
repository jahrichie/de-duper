class HomeController < ActionController::Base
  require "csv"

  def index
    render :layout  => 'application'
  end

  def intersect 
    if params[:a].present? && params[:b].present?
      @array1       = params[:a].split(',')
      @array2       = params[:b].split(',')
      @intersection = @array1 & @array2
    end
    render :layout  => 'application'
    
    # render :layout  => 'application'
    # respond_to do |format|       
    #   format.html  {}
    #   format.csv { render :layout => false }
    # end

  end

end

class HomeController < ActionController::Base
  require "csv"

  def index
    render :layout  => 'application'
  end

  def intersect 

    @array1       = params[:a].split(',')
    @array2       = params[:b].split(',')
    @intersection = @array1 & @array2
    

    respond_to do |format|       
      format.html  {render :layout  => 'application'}
      format.csv { render :layout => false }
    end

  end

end

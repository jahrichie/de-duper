class HomeController < ActionController::Base
  require "csv"

  def index
    render :layout  => 'application'
  end

  def intersect 
    if params[:a].present? && params[:b].present?
      @array1       = params[:a].gsub(/\s+/, ', ').strip.split(',')
      @array2       = params[:b].gsub(/\s+/, ', ').strip.split(',')
      @intersection = @array1 & @array2
      session[:intersection] = @intersection
    end
    render :layout  => 'application'
    
    # render :layout  => 'application'
    # respond_to do |format|       
    #   format.html  {}
    #   format.csv { render :layout => false }
    # end
  end
  def download
    respond_to do |format|       
      # format.csv { render :layout => false }
      format.csv  { send_data session[:intersection].to_csv  }

    end    
  end
end

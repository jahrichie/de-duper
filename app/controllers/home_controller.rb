class HomeController < ActionController::Base
  require "csv"

  def index
    render :layout  => 'application'
  end

  def results 
    if params[:a].present? && params[:b].present?
      array1        = params[:a].gsub(/\s+/, ', ').strip.split(',')
      array2        = params[:b].gsub(/\s+/, ', ').strip.split(',')
      @intersection = array1 & array2
      c         = array1 + array2
      @uniq     =  c.uniq
      #use session to store instance in memory for downloading
      session[:intersection] = @intersection
      session[:uniq]         = @uniq
    end
    render :layout  => 'application'
  end

  def download
    # raise "#{params[:var]}"
    case params[:var]
      when "intersection"
        _session_var = session[:intersection]
        _file_name   =  'duplications-list.csv'
      when "uniq"
        _session_var = session[:uniq]
        _file_name   =  'de-duped-list.csv'
    end  
    respond_to do |format|       
      # format.csv { render :layout => false }
      format.csv  { send_data _session_var.to_csv, :filename => _file_name  }

    end    
  end
end

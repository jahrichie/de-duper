class HomeController < ActionController::Base
  # before_filter :use_app_layout
  
  # def use_app_layout
  #   render :layout  => 'application'
  # end

  def index
    render :layout  => 'application'
  end

  def intersect 
    if params[:a].present? && params[:b].present?
      array1       = params[:a].split(',')
      array2       = params[:b].split(',')
      @intersection = array1 & array2

      respond_to do |format|
        format.html { render :layout  => 'application' }
        format.csv { send_data @intersection.to_csv }
        # format.xls # { send_data @products.to_csv(col_sep: "\t") }
      end
    end
    # render :layout  => 'application'
  end

end

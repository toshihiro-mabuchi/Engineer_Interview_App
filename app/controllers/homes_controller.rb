class HomesController < ApplicationController

  def top
    @patterns = Pattern.all.order(:id)
  end

end

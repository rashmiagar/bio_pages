class HomeController < ApplicationController

  def landing
  	if signed_in?
  	  redirect_to show_bio_pic_page_path(current_user)
  	end
  end
end

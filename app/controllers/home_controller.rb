class HomeController < ApplicationController

  layout [:profile], :only => :profile
	
  def index
  end

  def login
  end
 
  def register
	@user = User.new
  end

  def profile
  end
  	
end

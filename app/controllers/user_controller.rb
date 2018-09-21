class UserController < ApplicationController
  before_action :set_user  
  

  def sessions
	
  end

  def profile

  end
		
  private

  def set_user
    @user = User.find(current_user.id)
  end	
  
  def index

  end
	
 
end

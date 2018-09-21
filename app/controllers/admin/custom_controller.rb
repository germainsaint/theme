class Admin::CustomController < ApplicationController
  layout 'admin'

  def message
	
  end

  def send
	puts 'send'; 
	byebug
  end
end

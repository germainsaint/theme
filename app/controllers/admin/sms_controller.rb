class Admin::SmsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'admin'

  def send(*arg)

  end

  def index()

  end



end

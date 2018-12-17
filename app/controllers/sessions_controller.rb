class SessionsController < ApplicationController
	before_action :set_user, only: [:create]

  	# POST /sessions
  	def create
  		if @user && @user.authenticate(params[:password])
  			@user.update_token
    		json_response(@user)
    	else 
    		json_response({}, :unauthorized)
    	end
  	end

  	
    private

    def set_user
    	@user = User.find_by!(username: params[:username])
  	end
end

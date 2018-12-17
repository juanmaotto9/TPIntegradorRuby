class UsersController < ApplicationController

  	before_action :set_user, only: [:create]

  	# POST /users
  	def create

  		#crea un usuario con los parametros que me llegan
    	@user = User.create!(user_params)
    	json_response(@user, :created)
  	end

  	private

  	def user_params
    	params.permit(:username, :password, :screen_name, :email)
 	end

  	def set_user
    	@user = User.find_by!(token: params[:token])
  	end
end



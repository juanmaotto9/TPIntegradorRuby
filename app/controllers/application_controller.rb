class ApplicationController < ActionController::API
	include Response
  	include ExceptionHandler

  	def set_user
    	@user = User.find_by!(token: request.headers['X-QA-Key'])
    	json_response({}, :unauthorized) if !@user.token_valido?
  	end
end



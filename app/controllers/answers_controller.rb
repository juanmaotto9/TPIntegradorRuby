class AnswersController < ApplicationController
	before_action :set_question
	before_action :set_correct_answer, only: [:destroy]
	before_action :set_user, only:[:create, :destroy]

	# GET /questions/:question_id/answers
  	def index
    	json_response(@question.answers)
  	end

 	# POST /questions/:question_id/answers
  	def create
  		if @question.status == true
  			json_response(@question, :unprocessable_entity)
  		else
	   		@question.answers.create!(content: params[:content], user_id: @user.get_id)
	    	json_response(@question, :created)
		end
  	end

	# DELETE /questions/:question_id/answers/:id
  	def destroy
  	
  		if @question.my_user?(@user)
  			if !@question.my_answer?(@answer.id)
  				@answer.destroy
  				json_response(@answer)
  			else
  				json_response({}, :unprocessable_entity)
  			end
  		else
  			json_response({}, :unauthorized)
  		end
  	end


  	private

	def answer_params
	    params.permit(:content)
	end

	def set_user
	    @user = User.find_by!(token: request.headers['X-QA-Key'])
	    json_response({}, :unauthorized) if !@user.token_valido?
	end

	def set_question
	    @question = Question.find(params[:question_id])
	end

	def set_correct_answer
	    @answer = @question.answers.find_by!(id: params[:id]) if @question
	end

end

class QuestionsController < ApplicationController

	#mediante el set_user chequeo, ademas de que exista un usuario, que tenga token valido
	before_action :set_user_for_create, only: [:create]
    before_action :set_user, only: [:update, :resolve, :destroy]
	before_action :set_question, only: [:show, :update,:resolve, :destroy]
	

  	# GET /questions
	def index

		if params['sort'] == "pending_first"
			@questions = Question.all.order(:status,:created_at).limit(50)
		elsif params['sort'] == "needing_help"
			@questions = Question.all.where(status: false).order(:created_at).limit(50).reverse
		else
			@questions = Question.all.order(:created_at).limit(50).reverse
		end 
    	json_response(@questions)
  	end

  	# GET /questions/:id
  	def show

    	json_response(@question.por_id(params['id']))
  	end

  	# POST /questions
  	def create

    	@question = @user.questions.create!(question_params)
    	json_response(@question, :created)
  	end

	#PUT /questions/:id
  	def update

   	 	@question.update(question_params)
	    json_response(@question)
	end

  	# DELETE /questions/:id
	def destroy 

		if !@question.answers.exists?
			@question.eliminar(params['id'])
			json_response(@question)
		else
			json_response("Esta pregunta tiene respuesta", :unprocessable_entity)
		end
	end

	# PUT /questions/:id/resolve
	def resolve

 		if @question.answers.exists?(params[:answer_id])
 			@question.poner_en_true
			@question.set_answer(params[:answer_id])
	 		json_response(@question)
		else
	 		json_response("La respuesta no corresponde a esta pregunta", :unprocessable_entity)
	 	end
	end


  	private

  	def question_params
    	#parametros que llegaran por mas que no se envien 
    	params.permit(:title, :description)
  	end

  	def set_user_for_create
  		@user = User.find_by!(token: request.headers['X-QA-Key'])
    	json_response({}, :unauthorized) if !@user.token_valido?
  	end

  	def set_user
  		#se tiene que llamar "X-QA-Key"
    	@user = User.find_by!(token: request.headers['X-QA-Key'])
    	json_response({}, :unauthorized) if !@user.token_valido?
    	json_response({}, :unauthorized) if !@user.my_user?(@user)
  	end

  	def set_question
    	@question = Question.find(params[:id])
  	end
end

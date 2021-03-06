class QuestionsController < ApplicationController


    before_action :set_user, only: [:create, :update, :resolve, :destroy]
	before_action :set_question, only: [:show, :update,:resolve, :destroy]
	

  	# GET /questions
	def index
    case params["sort"]
		when "pending_first"
			@questions = Question.pending_first.limit(50)

		when "needing_help"
			@questions = Question.needing_help.limit(50)

		else
			@questions = Question.latest.limit(50)
		end

    render json: @questions, each_serializer: AllQuestionSerializer
  end




  	# GET /questions/:id
  	def show
        if params[:respuestas] == 'si'   
            json_response(@question, serializer: CompoundDocumentSerializer) 
        else
            json_response(@question)
        end
  	end

  	# POST /questions
  	def create
        params = question_params
        params['status'] = false
    	@question = @user.questions.create!(params)
    	json_response(@question, :created)
  	end

	#PUT /questions/:id
  	def update
        if @question.user == @user
            @question.update(question_params)
	        json_response(@question)
        else
            json_response("No sos el creador de la pregunta", :unauthorized)
        end
	end


  	# DELETE /questions/:id
	def destroy 

        if @question.user == @user
		      if !(@question.answers.count > 0)
                 @question.destroy
		      else
			     json_response("Esta pregunta no puede eliminarse, ya que posee respuesta/s", :unprocessable_entity)
		      end
        else
           json_response("No sos el creador de la pregunta", :unauthorized)
        end 
	end


	# PUT /questions/:id/resolve
	def resolve
        if @question.user == @user 
            if @question.answers.exists?(params[:answer_id])
                @question.status= true
                @question.answer_id= params[:answer_id]
                @question.save
                json_response(@question)
            else
                json_response("Esta respuesta no pertenece a esta pregunta", :unprocessable_entity)
            end
        else
            json_response("No sos el creador de la pregunta", :unauthorized)
        end
	end


  	private



    def question_params
        params.permit(:title, :description)
    end

  	def set_question
    	@question = Question.find(params[:id])
  	end
end

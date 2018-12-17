class AllQuestionSerializer < ActiveModel::Serializer
    	attributes :id, :title, :description, :status, :cant_answers

  	def description
  		object.description.truncate(120)
  	end

  	def cant_answers
		object.answers.count
	end
end

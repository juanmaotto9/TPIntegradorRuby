class Question < ApplicationRecord
  	belongs_to :user
  	has_many :answers

  	after_initialize :init

  	validates_presence_of :title, :description


  	def init

  		#inicializo status en false, ya que el por defecto los inicaliza nulo
  		self.status= false if self.status.nil?
  	end

  	def por_id(id_question)

  		#Busco la pregunta por "id_question"
  		Question.where(id: id_question) 
	end

	def my_user?(one_user)

		#Devuelve true si el usuario que hizo la pregunta es "one_user"
  		self.user == one_user
  	end

  	def eliminar(id_question)

  		#Elimina la pregunta (id_Question)
  		q = Question.find_by(id: id_question)
		q.destroy
  	end

  	def poner_en_true

  		#Pone el estado en true, es decir, marca la pregunta como contestada
  		self.status= true
  	end

  	def set_answer(id_answer)

  		#Setea el ID de la respuesta correcta
  		self.answer_id= id_answer
  	end

  	def my_answer?(id_answer)

  		#devuelve true si el id de la respuesta correcta es igual a "id_answer"
  		self.answer_id == id_answer
  	end


end


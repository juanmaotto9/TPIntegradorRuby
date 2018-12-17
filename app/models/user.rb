class User < ApplicationRecord
	has_many :questions
	has_many :answers
	has_secure_password
	has_secure_token

	after_initialize :init

	validates_presence_of :username, :password_digest, :email
	validates :email, uniqueness: true
	validates :username, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create


	def init

		#Para una futura inicializacion en caso de ser necesario
	end

	def update_token

		#Genera un nuevo token, pisando el que estaba y updatea el tiempo del nuevo token
		self.regenerate_token
		self.update(time_token: DateTime.now)
	end

	def token_valido?

		#Devuelve true si el token no esta vencido, es decir, se seteo hace menos de 30 minutos.
		#La devolucion es false en caso de que el time_token sea nulo.
		#Esto ultimo, se da porq cuando creo un usuario se me genera un token automaticamente...
		#...sin embargo el time_token queda nulo.
		#Entonces preguntado por .nil? me aseguro que el usuario haya iniciado sesion que es donde se le setea.	
		((DateTime.now.to_time - self.time_token.to_time)/1.minutes < 30) if !self.time_token.nil? 
	end

	def get_id

		#devuelve mi ID
		self.id
	end
end

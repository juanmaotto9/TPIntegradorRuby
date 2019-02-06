require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
  		@one = users(:valido)
  		@two = users(:invalido)
	end

  	test 'usuario es valido?' do

  		#Se espera que devuelva true, ya que el @one es valido.
 		assert @one.valid?
 	end 

	test 'invalido no tiene Email' do

		#Deberia dar true, ya que el @two tiene email invalido.

	    @one.email = nil
	    refute @one.valid?
	end


 	test 'cantidad de preguntas' do

 		#deberida devolver true, ya que @one tiene 3 preguntas hechas.
  		assert_equal 2, @one.questions.size
 	end


	test 'token_valido?' do
		@one.update_token
 		assert @one.token_valido?
 		refute @two.token_valido?
 	end 

 	test 'update_token' do

 		#Se actualiza el token invalido de @two por uno valido.
 		@two.update_token
 		assert @two.token_valido?
 	end	

end

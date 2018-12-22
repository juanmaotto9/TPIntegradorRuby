require 'test_helper'

class UserTest < ActiveSupport::TestCase

   	setup do
   		@User= users(:one)
  	end

  	test 'devuelve true si el token NO es valido' do

  		#Se espera que devuelva false, ya que @User no tiene iniciado un time_token
 		assert !@User.token_valido?
 	end 

 	
end

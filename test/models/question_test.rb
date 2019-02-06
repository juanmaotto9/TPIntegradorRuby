require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
	def setup
  		@user = users(:valido)
  		@hecha = questions(:hecha)
  		@sinhacer = questions(:sinhacer)
  		@answer = answers(:resp_one)
	end
  
    test 'pregunta valida' do
    
 	   	assert @hecha.valid?
 	end


	test "Estado debe incializarse en falso" do
		question= Question.new
		assert_not question.status, "its true"
	end


 	test 'respuesta a esta pregunta'do
 	 	assert @hecha.answer_id=@answer.id
 	end

 	test 'creador de la pregunta' do
 		assert @hecha.user = @user
 	end

 	test 'respuestas' do
  		assert_equal 2, @hecha.answers.size
 	end

 	test 'parametro latest' do

 		#deberia dar true en los tres asserts si "latest" hace lo pedido por la catedra
	  	assert_equal Question.latest.first, @hecha
	  	assert_equal Question.latest.second, @sinhacer
	end

	test '#needing_help' do

		#hecha esta resuelta y sinhacer no, por lo tanto si "needing help" hace...
		#...lo previsto por la catedra deberian pasar el test.
	    refute_includes Question.needing_help, @hecha
	    assert_includes Question.needing_help, @sinhacer
	end

end

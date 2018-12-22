require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

   	setup do
   		@Answer= answers(:one)
  	end


  	test "Se debe eliminar la pregunta" do
    	assert_difference("Answer.count",-1) do
        	@Answer.destroy
    	end
  	end

end

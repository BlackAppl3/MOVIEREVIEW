require 'test_helper'

class InformationControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


    test "Should go to index" do 
      get :information_index
      assert_response :success
    end

end

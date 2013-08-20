require 'spec_helper'
require 'factory_girl'
include Devise::TestHelpers

describe UsersController do
  before do
    sign_in @current_user = FactoryGirl.create(:user1)
  end
 describe "get follow" do
   it "should follow the given user" do 
     get :follow, :id => FactoryGirl.create(:user2).name
     expect(assigns(:follows)).to match_array(@current_user.following_users)
 	 expect(response).to render_template(:index) 
   end
 end

 describe "get unfollow" do
   it "should unfollow the given user" do 
     get :follow, :id => FactoryGirl.create(:user2).name
     expect(assigns(:follows)).to match_array(@current_user.all_following)
 	 expect(response).to render_template(:index) 
   end
 end

end

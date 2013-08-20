require 'spec_helper'

describe User do
  it "should not have blank name" do 
  	expect(User.new).to have(1).error_on(:name)
  end

  it "should have unique name" do 
  	user  = User.create(:name => "amar", :email => "abc@gmail.com", :password => "welcome123")
  	expect(User.create(:name => "amar", :email => "def@gmail.com", :password => "welcome234")).to have(1).error_on(:name)
  end

end

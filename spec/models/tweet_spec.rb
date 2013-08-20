require 'spec_helper'

describe Tweet do
  it "should have unique description" do
  	t = Tweet.create(:description => "Tweet1")
  	expect(Tweet.create(:description => "Tweet1")).to have(1).error_on(:description)
  end
end

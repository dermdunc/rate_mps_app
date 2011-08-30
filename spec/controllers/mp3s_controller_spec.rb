require 'spec_helper'

describe Mp3sController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @mp3 = Factory(:mp3)
    end
    
    it "should be successful" do
      get :show, :id => @mp3
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @mp3
      assigns(:mp3).should == @mp3
    end
  end
end
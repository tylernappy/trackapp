require 'spec_helper'

describe StaticController do

  describe "GET 'main'" do
    it "returns http success" do
      get 'main'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end

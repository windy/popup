require 'spec_helper'

describe ATT::SavePopup do
  before(:each) do
    #@b = TestBrowser.get
  end
  
  it "#exist?" do
    window = RAutomation::Window.new(:title=>"notexist")
    o = ATT::SavePopup.new(window)
    o.should respond_to("exist?")
    o.should respond_to("assert_exist?")
  end
  
  it "#set #saveas" do
    window = RAutomation::Window.new(:title=>"notexist")
    o = ATT::SavePopup.new(window)
    o.should respond_to("set")
    o.should respond_to("saveas")
    
  end
   #saveas
end

require 'spec_helper'

describe ATT::Popup do
  
  it "#exist?" do
    window = RAutomation::Window.new(:title=>"not exist")
    o = ATT::Popup.new(window)
    o.should respond_to("exist?")
    o.should respond_to("assert_exist?")
    o.should_not be_exist
  end
  
  it "#record" do
    ATT::Popup.should be_respond_to("record")
  end
  
  it "#find" do
    b = TestBrowser.get
    ATT::Popup.record
    b.file_field(:id,"file_popup").click_no_wait
    o = ATT::Popup.find
    o.should_not be_nil
    o.close
  end
  it "#find multi and test window" do
    b = TestBrowser.get
    ATT::Popup.record
    b.file_field(:id,"file_popup").click_no_wait
    c = Watir::IE.new
    o = ATT::Popup.find
    o.should_not be_nil
    # read window obj for more
    o.window.should_not be_nil
    o.close
    c.close
  end
end

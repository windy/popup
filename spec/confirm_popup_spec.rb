require 'spec_helper'

describe ATT::ConfirmPopup do
  before(:each) do
    @b = TestBrowser.get
  end
  
  it "#click" do
    confirm_button = @b.button(:id,"confirm_popup")
    ATT::ConfirmPopup.record
    confirm_button.click_no_wait
    o = ATT::ConfirmPopup.find
    o.click
    o.should_not be_exist
  end
  it "#set" do
    confirm_button = @b.button(:id,"confirm_popup")
    ATT::ConfirmPopup.record
    confirm_button.click_no_wait
    o = ATT::ConfirmPopup.find
    o.set
    o.should_not be_exist
    confirm_button.value.should == "true"
  end
  
  it "#clear" do
    confirm_button = @b.button(:id,"confirm_popup")
    ATT::ConfirmPopup.record
    confirm_button.click_no_wait
    o = ATT::ConfirmPopup.find
    o.clear
    o.should_not be_exist
    sleep 2
    confirm_button.value.should == "false"
  end
  
  it "#click but not found" do
    confirm_button = @b.button(:id,"confirm_popup")
    begin
      ATT::Config.timeout=5
      ATT::ConfirmPopup.record
      lambda  {ATT::ConfirmPopup.find }.should raise_error
    ensure
      ATT::Config.timeout=60
    end
  end
end

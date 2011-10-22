require 'spec_helper'

describe ATT::AlertPopup do
  before(:each) do
    @b = TestBrowser.get
  end
  
  it "#set" do
    file = @b.button(:id,"alert_popup")
    ATT::AlertPopup.record
    file.click_no_wait
    o = ATT::AlertPopup.find
    o.click
    sleep 1
    o.should_not be_exist
  end
  
  it "#find_when test" do
    alert = @b.button(:id,"alert_popup")
    ATT::AlertPopup.find_when { alert.click_no_wait }.click
  end
end

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
  
  it "#find_when in one block" do
    alert = @b.button(:id,"alert_popup")
    b2 = TestBrowser.get2
    alert2 = b2.button(:id,"alert_popup")
    ATT::AlertPopup.find_when {
      ATT::AlertPopup.find_when { alert2.click_no_wait }.click
      alert.click_no_wait
    }.click
  end
  
end

require 'spec_helper'
gem "watir","1.6.5"
require 'watir'

describe ATT::FilePopup do
  before(:each) do
    @b = TestBrowser.get
  end
  
  it "#exist?" do
    window = RAutomation::Window.new(:title=>"notexist")
    o = ATT::FilePopup.new(window)
    o.should respond_to("exist?")
    o.should respond_to("assert_exist?")
  end
  
  it "#set" do
    file = @b.file_field(:id,"file_popup")
    ATT::FilePopup.record
    file.click_no_wait
    o = ATT::FilePopup.find
    o.set("file_popup/test.txt")
    o.should_not be_exist
    file.value.should =~ /test.txt$/
  end
  
  it "#set absolute path" do
    file = @b.file_field(:id,"file_popup")
    ATT::FilePopup.record
    file.click_no_wait
    o = ATT::FilePopup.find
    lambda { o.set("file_popup/no_exist.txt") }.should raise_error
    absolute_path = Pathname.new(File.join(ATT::Config.root,"file_popup/test1.txt")).realpath
    o.set(absolute_path)
    o.should_not be_exist
    file.value.should =~ /test1.txt$/
  end
end

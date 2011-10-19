require 'spec_helper'
gem "watir","1.6.5"
require 'watir'
describe ATT::PopupWindow do
  it '#listen' do
    b = TestBrowser.get
    th = ATT::PopupWindow.listen do |popup|
      popup.close
    end
    b.file_field(:id,"file_popup").click_no_wait
    sleep 10
    ATT::Popup.find_all.should == []
    ATT::PopupWindow.stop_listen(th)
    b.close
  end
  
  it '#stop_listen all' do
    th = ATT::PopupWindow.listen do |p|
      puts 'ok'
    end
    #sleep 20
    ATT::PopupWindow.stop_listen('all')
    ATT::PopupWindow.listen_threads.should == []
  end
  
end
$LOAD_PATH.unshift File.join(__FILE__,'..','..','lib')
require 'popup'
require 'rspec'
require 'watir'
ATT::Config.root = File.join(__FILE__,'..','..','support')

require 'webserver'

class TestBrowser
  def self.get(type= :ie)
    @server || start_server
    if @browser.nil?
      @browser = Watir::Browser.new()
      @browser.goto("http://localhost:#{@port}/file.html")
    end
    at_exit { close rescue nil }
    @browser
  end
  
  def self.get2(type= :ie)
    @server || start_server
    if @browser2.nil?
      @browser2 = Watir::Browser.new()
      @browser2.goto("http://localhost:#{@port}/file.html")
    end
    at_exit { @browser2.close rescue nil }
    @browser2
  end
  
  def self.start_server
    @server = PopupServer.new
    @port = @server.port
    @server.start
  end
  
  def self.close
    @browser.close
    @server.stop
  end
end

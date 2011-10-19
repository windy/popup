$LOAD_PATH.unshift File.join(__FILE__,'..','..','lib')
require 'popup'
require 'rspec'
ATT::Config.root = File.join(__FILE__,'..','..','support')

require 'webserver'

class TestBrowser
  def self.get(type= :ie)
    @server || start_server
    if @browser.nil?
      @browser = Watir::Browser.new()
      @browser.goto("http://localhost:#{@port}/file.html")
    end
    at_exit { close }
    @browser
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

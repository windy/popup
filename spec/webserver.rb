require 'webrick'
require 'timeout'

class PopupServer
  
  attr_reader :port,:run
  def initialize(port=12345)
    @run = false
    @port = port
    @s = WEBrick::HTTPServer.new(
    :Port=> @port,
    :DocumentRoot => File.join(File.join(__FILE__,'..','..','support'),"html_popup")
    )
    @s.mount("/html_popup",WEBrick::HTTPServlet::FileHandler,"/file.html")
  end

  def start(wait_forever = false)
    raise "popup server is running,can NOT run again" if @run
    @run = true
    @s_thread = Thread.new do
      @s.start
    end
    wait
    @s_thread.join if wait_forever
  end
  
  def wait(timeout=10)
    Timeout.timeout(timeout,"after #{timeout} popup server still can NOT start") do
      loop do
        begin
          TCPSocket.new("127.0.0.1",@port)
          return true
        rescue
          sleep 0.5
        end
      end
    end
  end
  
  def stop
    @s.shutdown
    @run = false
  end

end

if $0 == __FILE__
  a = PopupServer.new
  a.start(true)
  #sleep 100
  #a.stop
end

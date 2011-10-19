require 'popup/ext/rautomation_ext'
require 'popup/popup_window'
module ATT
  module Config
    module_function
    def root
      @root || ( raise ATT::RootNotSetError,'please use ATT::Config.root=(path) to set.' )
    end
    
    module_function
    def root=(root)
      @root=root
    end
    
    module_function
    def timeout=(timeout)
      @timeout  = timeout
    end
    
    module_function
    def timeout
      @timeout || 60
    end
  end
  
  class Popup
    @@windows = nil
    RAutomation::Window.wait_timeout = Config::timeout
    ENV["RAUTOMATION_ADAPTER"] = "autoit"
    def initialize(window) # :nodoc: 
      @window = window
    end
    
# Get a popup between record() and find(),
# * If not found, it will raise +WindowNotFoundError
# * Else, if found more than one windows, it will raise MutliWindowsMatchError
# * +ATTEND+: must call record() before use it.
# @Return: Popup object that is found.
    def self.find
      raise NotRecordError,"please call record() before use me." unless @@windows
      windows_new = []
      begin
        RAutomation::WaitHelper.wait_until(Config::timeout) do
          sleep 0.5
          windows_now = collect_windows
          windows_new = windows_now - @@windows
          windows_new.size > 0 && windows_new.reject! { |h| RAutomation::Window.new(:hwnd=>h).text.chomp == "" }
          windows_new.size > 0
        end
      rescue RAutomation::WaitHelper::TimeoutError
        raise WindowNotFoundError,"can not found new window in time #{Config::timeout} seconds"
      end
      #~ puts "new = " + (windows_new.collect do |hwnd| RAutomation::Window.new(:hwnd=>hwnd,:adapter=>"autoit").text end).join(",")
      # TODO: next week we should guess one window, but not raise a big exception
      raise MutliWindowsMatchError,"more than one windows opened between record() and find()" if windows_new.size > 1
      window = RAutomation::Window.new(:hwnd => windows_new[0] ) if windows_new.size == 1
      return self.new(window)
    end
    
    def self.find_all
      windows_now = collect_windows
      windows_new = windows_now - @@windows
      windows_new.collect { |hwnd| self.new( RAutomation::Window.new(:hwnd => hwnd ) ) }
    end
    
# Record all the windows availed now.
# @return: Array that contains all the hwnd of visble windows.
    def self.record
      @@windows = collect_windows
    end
    # :nodoc: 
    def self.collect_windows
      RAutomation::Window.windows.collect { |w| w.hwnd }.find_all { |hwnd| PopupWindow.is_popup?(hwnd) }
    end

# Find a new popup when execute the block you have given.
# 
    def self.find_when # :yields: 
      record
      begin
        thread = Thread.new {
          yield
        }
        find
      ensure
        thread.kill
      end
    end

# Close the window
# It behave as click x button at the right postion above.
    def close
      @window.close
    end
# @return: true if window exist
# false if not
    def assert_exist?
      @window.exist?
    end
    
    alias exist? assert_exist?
    
    private
    def config
      @config ||= WindowFactory.config(self.class)
    end      
  end
  
end

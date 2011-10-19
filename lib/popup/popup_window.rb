require 'ffi'
module ATT
  class PopupWindow
    extend FFI::Library
    ffi_lib 'user32'
    attach_function :GetWindow, [ :long, :uint ], :long
    attach_function :GetParent, [ :long ], :long
    
    # check the window of hwnd whether a popup window
    def self.is_popup?(hwnd)
      GetWindow( hwnd, 4 ) != 0
    end
    
    @@listen_threads = []
    
    def self.listen(interval=5) # :yields: popup
      th = Thread.new do
        Popup.record
        begin
          loop do 
            sleep interval
            news = Popup.find_all
            news.each do |popup|
              yield popup
            end
          end
        end
      end
      @@listen_threads << th
      th
    end
    
    def self.stop_listen(thread = 'all')
      if thread == 'all'
        @@listen_threads.each do |thread|
          begin
          thread.kill
          rescue Exception
            puts $!
          end
        end
        @@listen_threads =[]
      elsif @@listen_threads.delete(thread)
        thread.kill
      end
    end
    
    def self.listen_threads
      @@listen_threads
    end
    
  end
end
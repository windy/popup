require 'pathname'
module ATT
  class FilePopup < Popup
    include FileExt
    CONFIRM_TEXT = [ "OPEN", "打开", "Open" ]
# Set File Popup with file_path, then click confirm button.
# @param file_path
# @return: none
# Will raise FileNotFoundError when file_path is valid path
#  Raise RootNotSetError when ATT::Config.root not set and path is not an absolute path
    def set(file_path)
      check_file_exist?(file_path)
      set_text(file_path)
      click_confirm
    end
    
    def set_text(file_path)
      #@text_field = WindowFactory.make_other(@window, config["edit"] )
      text_field.set(window_full_path(file_path))
    end
    
    def text_field
      @window.text_field(:instance=>1)
    end
    
    def click_confirm
      #@window.button( config("open_button") ).click
      #WindowFactory.make_other( @window,config["confirm"] ).click
      confirm_button.click
    end
    
    def confirm_button
      most_like = @window.button(:index=>1)
      CONFIRM_TEXT.each do |text| 
        most_like.value.include?(text)  && ( return most_like )
      end
      # Warning:at the most time it should be the button index is 1, if not,
      # Now we try find one matched button with CONFIRM_TEXT.
      @window.buttons.find do |button| 
        CONFIRM_TEXT.each do |text|
          button.value.include?(text) && ( break true ) || false
        end
      end
    end
    
    
  end
end
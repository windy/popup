module ATT
  class SavePopup < Popup
    include FileExt
    # TODO:
    # Save diaglog as a file 
    # if +file_path+ is relative path, it will be expand to abosulte path join with ATT::Config.root
    # @param: file_path
    def saveas(file_path)
      confirm_button.click
    end
    
    alias set click

    def confirm_button # :nodoc:
      @window.button(:instance=>1)
    end
  end
end
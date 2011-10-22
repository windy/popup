module ATT
  # for save as dialog
  class SavePopup < FilePopup

    # Save diaglog as a file 
    # if +file_path+ is relative path, it will be expand to abosulte path join with ATT::Config.root
    # @param: file_path
    def set(file_path)
      check_file_not_exist?(file_path)
      set_text(file_path)
      click_confirm
    end
    
    alias click set
    alias saveas set
  end
end
module ATT
  # for save as dialog
  class SavePopup < FilePopup

    # Save dialog as a file
    # if +file_path+ is nil,it will take the default name given by dialog.elsif +file_path+ is relative path, it will be expand to abosulte path join with ATT::Config.root
    # @param: file_path
    def set(file_path='')
      if file_path.to_s.strip.length == 0 # It's nil, empty, or just whitespace
        file_name = text_field.value
        file_path = File.join(Config.root, file_name)
      end
      check_file_not_exist?(file_path)
      set_text(file_path)
      click_confirm
    end
    
    alias click set
    alias saveas set
  end
end

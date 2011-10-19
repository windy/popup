module ATT
  class ConfirmPopup < Popup
    # Click
    def click
      confirm_button.click
    end
    
    alias set click
    
    def cancel
      cancel_button.click
    end
    
    alias clear cancel
    
    # @private
    def confirm_button
      @window.button(:instance=>1)
    end
    
    # @private
    def cancel_button
      @window.button(:instance=>2)
    end
  end
end
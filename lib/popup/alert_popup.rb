module ATT
  class AlertPopup < Popup
    # Click
    def click
      confirm_button.click
    end
    alias set click
    # @private
    def confirm_button
      @window.button(:instance=>1)
    end
  end
end
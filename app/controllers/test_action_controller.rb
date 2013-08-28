require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

class TestActionController < ApplicationController
  def fire
  	API.all_windows.select {|w| w.title == params[:test_action][:application_name] }.each do |win|
      frame = win.screen.frame_without_dock_or_menu
      frame.h /= 2
      win.frame = frame
  	end
    flash.now[:success] = "Action completed successfully!"
    render 'form'
  end

  def form

  end
end

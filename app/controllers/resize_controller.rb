require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

class ResizeController < ApplicationController
  def fire
  	API.all_windows.select {|w| w.title == params[:target_app] }.each do |win|
      frame = win.screen.frame_without_dock_or_menu
      frame.h /= 2
      win.frame = frame
  	end
    flash.now[:success] = "Action completed successfully!"
  end
end

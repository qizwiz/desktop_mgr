require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

class ResizeController < ApplicationController
  def fire
  	API.all_windows.select {|w| w.title == params[:target_app] }.each do |win|
      if params[:position] == "top"
        frame = win.screen.frame_without_dock_or_menu
        frame.h /= 2
        win.frame = frame
        win.focus_window
      elsif params[:position] == "left"
        frame = win.screen.frame_without_dock_or_menu
        frame.w /= 2
        win.frame = frame
        win.focus_window
      elsif params[:position] == "right"
        frame = win.screen.frame_without_dock_or_menu
        frame.w /= 2
        frame.x = frame.w
        win.frame = frame
        win.focus_window
      elsif params[:position] == "bottom"
        frame = win.screen.frame_without_dock_or_menu
        frame.h /= 2
        frame.y = frame.h
        win.frame = frame
        win.focus_window
      end
  	end
    flash.now[:success] = "Action completed successfully!"
  end
end

require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

class ResizeController < ApplicationController
  def fire
  	API.all_windows.select {|w| w.title == params[:target_app] }.each do |win|
      # how about something like this
      rs = Resizer.new
      rs.send :"#{params[:position]}", win
      
    end
  end
end

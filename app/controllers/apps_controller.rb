require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

class AppsController < ApplicationController
  def index
    @apps = API.visible_windows.reject {|w| w.title.empty?}.map {|w| w.title}
  end
end
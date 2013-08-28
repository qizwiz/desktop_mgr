require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

class AppsController < ApplicationController
	def index
		@apps = API.visible_windows.map { |w| w.app.title}.sort
	end
end
class HomeController < ApplicationController

	def index
		@user = current_user
		@statuses = @user.statuses.select do |status|
			status.exercise.rotation == 0 || status.exercise.rotation == @user.rotation
		end
	end

end
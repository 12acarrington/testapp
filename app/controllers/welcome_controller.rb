class WelcomeController < ApplicationController
	def index
		if signed_in?
			# get the current user and store it in the @user variable
			@user = current_user
			# create an empty micropost which can use on the form
			@micropost = current_user.microposts.build
			# get the current user's feed
			@microposts = current_user.feed.paginate(page: params[:page])
		end
	end
end

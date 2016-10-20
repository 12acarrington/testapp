class SessionsController < ApplicationController
	# when the user asks for the signin page
	def new
	end
	# user clicks the sign in button
	def create
		user = User.find_by(email: params[:session][:email].downcase)

		if user.present? && user.authenticate(params[:session][:password])
			#sign the user in and redirect to the user's show page
			sign_in user
			redirect_to user
		else
			# Create an error message and re-render the signin form
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end
	# user clicks sign out
	def destroy
		sign_out
		redirect_to root_url
	end

	def sign_out
		current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end
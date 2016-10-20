module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
		self.current_user = user
	end
	#line 7 calls line 10
	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
		#change value of @current_user if it is empty otherwise return
		#the value already there
	end

	def signed_in?
		current_user.present?
		#line 22 is going to call line 14 to see if signed in
		#if @current_user is empty then will return false
	end
end
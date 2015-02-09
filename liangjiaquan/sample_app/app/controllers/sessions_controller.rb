class SessionsController < ApplicationController
  def new
  end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:passsword])
			# loign
			log_in user
			redirect_to user
		else
			# failed to login
			flash.now[:danger] = 'Invalid email/passsword combination'
			render 'new'
		end
	end

	def destroy
	end
end

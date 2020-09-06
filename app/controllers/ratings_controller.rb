class RatingsController < ApplicationController
	def new
		@rating = Rating.new
	end

	def index
	end

	def show
		@rating = Rating.find(params[:rating_id])
	end
	def create
		@user = User.find(session[:user_id])
		@comment = @user.ratings.create(rating_params)
	end

	def destroy
		@rating = Rating.find(params[:id])
		@rating.destroy
	end

	private def rating_params
	    params.require(:rating).permit(:user, :body, :rate, :rateditem)
    end
end

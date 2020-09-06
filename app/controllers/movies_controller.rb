class MoviesController < ApplicationController
	def new
	end

	def show
		@movie = get_movie(params[:id])
		@recommendations = get_recommendations(params[:id])
        @ratings = Rating.where(rateditem: params[:id])
        @ratingcount = Rating.where(rateditem: params[:id]).group('rate').count
	end

	def index
		
	end

	def request_api(url)
        response = Excon.get(url)
        return nil if response.status != 200
        JSON.parse(response.body)
    end
    def get_movie(id)
    	puts id
        request_api(
            "https://api.themoviedb.org/3/movie/" + id + "?api_key=74c85d204bc9670c9a981ff5198edee2"
        )
    end
    def recommendations_api(url)
        response = Excon.get(url)
        return nil if response.status != 200
        JSON.parse(response.body)["results"]
    end
    def get_recommendations(id)
        recommendations_api(
            "https://api.themoviedb.org/3/movie/" + id + "/recommendations?api_key=74c85d204bc9670c9a981ff5198edee2"
        )
    end
end

class AjaxController < ApplicationController
  def index
  	@recommendations = get_recommendations()
    @ratings = Rating.all.order("created_at ASC").limit(10)
  end

  private
  def request_api(url)
    response = Excon.get(url)
    return nil if response.status != 200
    JSON.parse(response.body)["results"]
  end
  def get_recommendations()
    request_api(
      "https://api.themoviedb.org/3/trending/all/day?api_key=74c85d204bc9670c9a981ff5198edee2"
    )
  end
end

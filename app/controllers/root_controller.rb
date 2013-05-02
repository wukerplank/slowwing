class RootController < ApplicationController

  # The action for our publish form.
  def search
    @foursquare_results = FoursquareClient.search(params)
    @yelp_results = YelpClient.search(params)
    
    @results = (@foursquare_results + @yelp_results).sort{|x,y| x['name']<=>y['name']}
  end

end
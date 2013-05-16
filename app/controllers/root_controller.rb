class RootController < ApplicationController

  # The action for our publish form.
  def search
    #start = Time.now.to_f

    #@foursquare_results = FoursquareClient.search(params)
    #@yelp_results = YelpClient.search(params)

    #duration = Time.now.to_f - start

    #puts "Duration: #{duration}"

    sleep 1.86

    File.open("lib/tasks/yelp.json") do |f|
      @yelp_results = JSON.parse(f.read)
    end

    File.open("lib/tasks/foursquare.json") do |f|
      @foursquare_results = JSON.parse(f.read)
    end

    #logger.info(@yelp_results.inspect)

    #logger.info(@foursquare_results.inspect)

    @results = (@foursquare_results + @yelp_results).sort{|x,y| x['name']<=>y['name']}
  end

end
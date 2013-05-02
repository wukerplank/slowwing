class FoursquareClient
  
  
  def self.search(options)
    options['limit'] ||= 10

    # Instantiate client
    @client = Foursquare2::Client.new(
      :client_id     => ENV['FOURSQUARE_CLIENT_ID'],
      :client_secret => ENV['FOURSQUARE_CLIENT_SECRET']
    )
    
    if(options[:location].present?)
      results = self.location_search(options)
    else
      results = self.coordinates_search(options)
    end
    
    final_results = []

    results.groups[0].items.each do |result|
      businesses = {
        'name'        => result.name,
        'description' => nil,
        'source_url'  => result.canonicalUrl,
        'rating'      => nil,
        'source'      => 'foursquare'
      }
      if result.location.present?
        businesses = businesses.merge({
          'street' => result.location.address,
          'zip'    => result.location.postal_code,
          'city'   => result.location.city,
          'lat'    => result.location.lat,
          'lng'    => result.location.lng
        })
      else
        businesses = businesses.merge({'street'=>'', 'zip'=>'', 'city'=>'', 'lat'=>'', 'lng'=>''})
      end
        
      final_results << businesses
    end
    
    return final_results
  end
  
  def self.location_search(options)
    @client.search_venues(
      :near => options['location'],
      :query => options['term'],
      :limit => options['limit']
    )
  end
  
  def self.coordinates_search(options)
    @client.search_venues(
      :ll => "#{options['lat']},#{options['lng']}",
      :query => options['term'],
      :limit => options['limit']
    )
  end
  
end

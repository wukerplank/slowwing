class YelpClient
  
  
  def self.search(options)
    @api_credentials = {
      :consumer_key    => ENV['YELP_CONSUMER_KEY'],
      :consumer_secret => ENV['YELP_CONSUMER_SECRET'],
      :token           => ENV['YELP_TOKEN'],
      :token_secret    => ENV['YELP_TOKEN_SECRET']
    }
    
    options['limit'] ||= 10
    
    @client = Yelp::Client.new
    
    if(options[:location].present?)
      results = self.location_search(options)
    else
      results = self.coordinates_search(options)
    end
    
    final_results = []
    
    results['businesses'].each do |result|
      final_result = {
        'name'        => result['name'],
        'description' => (result['snippet_text'] || ''),
        'source_url'  => result['url'],
        'rating'      => result['rating'],
        'source'      => 'yelp'
      }
      if result['location'].present?
        final_result = final_result.merge({
          'street' => result['location']['display_address'][0],
          'zip'    => result['location']['postal_code'],
          'city'   => result['location']['city'],
          'lat'    => result['location']['coordinate']['latitude'],
          'lng'    => result['location']['coordinate']['longitude']
        })
      else
        final_result = final_result.merge({'street'=>'', 'zip'=>'', 'city'=>'', 'lat'=>'', 'lng'=>''})
      end
      
      final_results << final_result
    end
    
    return final_results
  end
  
  def self.location_search(options)
    request = Yelp::V2::Search::Request::Location.new({
      :term  => options['term'], 
      :city  => options['location'],
      :limit => options['limit']}.merge(@api_credentials)
    )
    return @client.search(request)
  end
  
  def self.coordinates_search(options)
    request = Yelp::V2::Search::Request::GeoPoint.new({
      :term      => options['term'], 
      :latitude  => options['lat'], 
      :longitude => options['lng'],
      :limit     => options['limit']}.merge(@api_credentials)
    )
    return @client.search(request)
  end
  
end
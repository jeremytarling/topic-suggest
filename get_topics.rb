#!/Users/tarlij01/.rvm/rubies/ruby-1.9.3-p448/bin/ruby

require './alchemyapi'

demo_url=ARGV[0]

alchemyapi = AlchemyAPI.new()


puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.combined('url', demo_url, { 'extract'=>'page-image,keyword,entity' })

if response['status'] == 'OK'

	if response.key?('entities')
        
		for entity in response['entities']
  		
      if entity.key?('disambiguated')
        
  			if entity['relevance'].to_f > 0.3
  		
        	puts "text: " + entity['text']
        
    			puts "relevance: " + entity['relevance']
  			
          puts "count: " + entity['count']
  			
          puts "type: " + entity['type']
          			
  				puts "disambiguated: "
        
  				if entity['disambiguated'].key?('dbpedia')
  					puts "\tdbpedia: " + entity['disambiguated']['dbpedia']
  				end
				
          if entity['disambiguated'].key?('freebase')
  					puts "\tfreebase: " + entity['disambiguated']['freebase']
          end
        
          puts ''
          
        end # if entity['relevance'] > 0.4
        
      end # if entity.key?('disambiguated')
        
		end # close for entity in response['entities']
    
  end # if response.key?('entities')
        
else # if response['status'] != 'OK'
  
	puts 'Error: ' + response['statusInfo']

end



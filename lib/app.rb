gem'nokogiri'
require 'nokogiri'
require 'open-uri'
   
 def download_page(tab)   
         page=Nokogiri::HTML(open(tab))
        return page 
end
 
def tableaux 
	  result = Array.new ()
     tableau = Array.new()
     tabb   = Array.new()
     res  = Array.new()
 
   page   = download_page("https://coinmarketcap.com/all/views/all/") 
   tabb   = page.xpath('//h1[@class="text-left col-symbol"]')
   price  = page.xpath('//td[@class="no-wrap text-right"]')
          i = 0 
          j = 0
         while i< tabb.length
          	result[i] = tabb[j].text  
            result[i+1] = price[j].text.scan(/\d/).join('').to_f
            #tableau = download_page().xpath('//td[@class="text-left col-symbol"]')[i].text
              j +=1
              i +=2
        end
       res = [Hash[*result]]
end
  puts tableaux 
require "open-uri"
require "nokogiri"

def good_reads(search_term)
  # TODO: return an array of Antiques found of Craigslist for this `city`.
  greads = open("https://www.elefant.ro/search?SearchTerm=#{search_term}").read
  doc = Nokogiri::HTML(greads)
  doc.search('.product-list-item').each_with_index do |element, index|
   puts index + 1
   address = element.attributes['data-action'].value
   newone = open(address).read
   doc1 = Nokogiri::HTML(newone)
   p doc1.search('.product-manufacturer').children.text.strip

  end

end

good_reads("ewan")

# html_content = open('https://www.etsy.com/search?q=wallet').read
# doc = Nokogiri::HTML(html_content)

# doc.search('.responsive-listing-grid .v2-listing-card__info .text-body').each_with_index do |element, index|
#   puts "#{index + 1}. #{element.text.strip}"
# end

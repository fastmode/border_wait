require 'nokogiri'
require 'open-uri'
require 'pry'


site = "https://apps.cbp.gov/bwt/bwt.xml"
doc = Nokogiri::HTML(open(site))
#doc = Nokogiri::XML(open(site))


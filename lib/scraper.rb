require "nokogiri"
require "open-uri"
require "pry"

site = "https://apps.cbp.gov/bwt/bwt.xml"
doc = Nokogiri::HTML(open(site))

ports = []

doc.css("port").each do |p|
	port_number = p.css("port_number").text
	border = p.css("border").text
	port_name = p.css("port_name").text
	crossing_name = p.css("crossing_name").text
	hours = p.css("hours").text
	date = p.css("date").text
	port_status = p.css("port_status").text


	#p.css("commercial_vehicle_lanes standard_lanes lanes_open").text
end

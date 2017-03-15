require "nokogiri"
require "open-uri"
require "pry"

site = "https://apps.cbp.gov/bwt/bwt.xml"
doc = Nokogiri::HTML(open(site))

ports = []

doc.css("port").each do |p|
	# Port Information
	port_number = p.css("port_number").text
	border = p.css("border").text
	port_name = p.css("port_name").text
	crossing_name = p.css("crossing_name").text
	hours = p.css("hours").text
	date = p.css("date").text
	port_status = p.css("port_status").text

	# Commercial Vehicle Lanes Information
	comm_max_lanes = p.css("commercial_vehicle_lanes maximum_lanes").text
	comm_standard_update_time = p.css("commercial_vehicle_lanes standard_lanes update_time").text
	comm_standard_operational_status = p.css("commercial_vehicle_lanes standard_lanes operational_status").text
	comm_standard_delay_minutes = p.css("commercial_vehicle_lanes standard_lanes delay_minutes").text
	comm_standard_lanes_open = p.css("commercial_vehicle_lanes standard_lanes lanes_open").text

	binding.pry
end

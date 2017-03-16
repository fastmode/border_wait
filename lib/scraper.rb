require "nokogiri"
require "open-uri"

class Scraper
	
	def self.scrape_port_wait_times(url)

		doc = Nokogiri::HTML(open(url))

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
			comm_fast_operational_status = p.css("commercial_vehicle_lanes fast_lanes operational_status").text
			comm_fast_update_time = p.css("commercial_vehicle_lanes fast_lanes update_time").text
			comm_fast_delay_minutes = p.css("commercial_vehicle_lanes fast_lanes delay_minutes").text
			comm_fast_lanes_open = p.css("commercial_vehicle_lanes fast_lanes lanes_open").text

			# Passenger Vehicle Lanes
			pass_max_lanes = p.css("passenger_vehicle_lanes maximum_lanes").text
			pass_standard_update_time = p.css("passenger_vehicle_lanes standard_lanes update_time").text
			pass_standard_operational_status = p.css("passenger_vehicle_lanes standard_lanes operational_status").text
			pass_standard_delay_minutes = p.css("passenger_vehicle_lanes standard_lanes delay_minutes").text
			pass_standard_lanes_open = p.css("passenger_vehicle_lanes standard_lanes lanes_open").text
			pass_sentri_update_time = p.css("passenger_vehicle_lanes nexus_sentri_lanes update_time").text
			pass_sentri_operational_status = p.css("passenger_vehicle_lanes nexus_sentri_lanes operational_status").text
			pass_sentri_delay_minutes = p.css("passenger_vehicle_lanes nexus_sentri_lanes delay_minutes").text
			pass_sentri_lanes_open = p.css("passenger_vehicle_lanes nexus_sentri_lanes lanes_open").text
			pass_ready_update_time = p.css("passenger_vehicle_lanes ready_lanes update_time").text
			pass_ready_operational_status = p.css("passenger_vehicle_lanes ready_lanes operational_status").text
			pass_ready_delay_minutes = p.css("passenger_vehicle_lanes ready_lanes delay_minutes").text
			pass_ready_lanes_open = p.css("passenger_vehicle_lanes ready_lanes lanes_open").text

			# Pedestrian Lanes
			ped_max_lanes = p.css("pedestrian_lanes maximum_lanes").text
			ped_standard_update_time = p.css("pedestrian_lanes standard_lanes update_time").text
			ped_standard_operational_status = p.css("pedestrian_lanes standard_lanes operational_status").text
			ped_standard_delay_minutes = p.css("pedestrian_lanes standard_lanes delay_minutes").text
			ped_standard_lanes_open = p.css("pedestrian_lanes standard_lanes lanes_open").text
			ped_ready_update_time = p.css("pedestrian_lanes ready_lanes update_time").text
			ped_ready_operational_status = p.css("pedestrian_lanes ready_lanes operational_status").text
			ped_ready_delay_minutes = p.css("pedestrian_lanes ready_lanes delay_minutes").text
			ped_ready_lanes_open = p.css("pedestrian_lanes ready_lanes lanes_open").text

			# Save each hash into the ports array
			ports << {
				port_number: port_number, 
				border: border, 
				port_name: port_name, 
				crossing_name: crossing_name, 
				hours: hours, 
				date: date, 
				port_status: port_status, 
				comm_max_lanes: comm_max_lanes,
				comm_standard_update_time: comm_standard_update_time,
				comm_standard_operational_status: comm_standard_operational_status,
				comm_standard_delay_minutes: comm_standard_delay_minutes,
				comm_standard_lanes_open: comm_standard_lanes_open,
				comm_fast_operational_status: comm_fast_operational_status,
				comm_fast_update_time: comm_fast_update_time,
				comm_fast_delay_minutes: comm_fast_delay_minutes,
				comm_fast_lanes_open: comm_fast_lanes_open,
				pass_max_lanes: pass_max_lanes,
				pass_standard_update_time: pass_standard_update_time,
				pass_standard_operational_status: pass_standard_operational_status,
				pass_standard_delay_minutes: pass_standard_delay_minutes,
				pass_standard_lanes_open: pass_standard_lanes_open,
				pass_sentri_update_time: pass_sentri_update_time,
				pass_sentri_operational_status: pass_sentri_operational_status,
				pass_sentri_delay_minutes: pass_sentri_delay_minutes,
				pass_sentri_lanes_open: pass_sentri_lanes_open,
				pass_ready_update_time: pass_ready_update_time,
				pass_ready_operational_status: pass_ready_operational_status,
				pass_ready_delay_minutes: pass_ready_delay_minutes,
				pass_ready_lanes_open: pass_ready_lanes_open,
				ped_max_lanes: ped_max_lanes,
				ped_standard_update_time: ped_standard_update_time,
				ped_standard_operational_status: ped_standard_operational_status,
				ped_standard_delay_minutes: ped_standard_delay_minutes,
				ped_standard_lanes_open: ped_standard_lanes_open,
				ped_ready_update_time: ped_ready_update_time,
				ped_ready_operational_status: ped_ready_operational_status,
				ped_ready_delay_minutes: ped_ready_delay_minutes,
				ped_ready_lanes_open: ped_ready_lanes_open
			}
		end
		# Returns port hash
		ports
	end

end
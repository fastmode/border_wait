require_relative "../lib/scraper.rb"
require_relative "../lib/ports.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInteface
#  SITE = "./fixtures/html/bwt.xml"
  SITE = "https://apps.cbp.gov/bwt/bwt.xml"
  
  def run
    make_ports
    welcome_display
    display_country_ports
    goodbye
  end
  
  def make_ports
    ports_array = Scraper.scrape_port_wait_times(SITE)
    Ports.create_from_collection(ports_array)
  end
  
  def welcome_display
    puts ""
    puts "Welcome to Border Wait"
    puts "-Find out current border wait times"

    initial_options
  end
  
  def initial_options
    puts ""
    puts "Please select an option from below"
    puts " 1. Canadian Border Ports"
    puts " 2. Mexico Border Ports"
    puts " 3. List all ports details"
    puts " 4. Exit program"
  end
  
  def display_country_ports
    input = nil
    while input != "exit"
      print "[1-4]: "
      input = gets.strip
      if input == "1"
        country_border("Canadian Border")
      elsif input == "2"
        country_border("Mexican Border")
      elsif input == "3"
        display_all_ports
      elsif input == "4"
        break
      else
        puts "Please enter a correct option."
      end
      initial_options
    end
  end
  
  def country_border(city)
    puts ""
    puts city.upcase.colorize(:blue)
    country = Ports.all.select { |i| i.border == city}
    country.each.with_index(1) do |port, i|
      puts "#{i}. #{port.port_name}  #{port.crossing_name}"
    end
    print "Please select a port of entry: "
    city = gets.strip.to_i-1
    puts ""
    puts "#{country[city].port_name.upcase.colorize(:blue)}" + " |  #{country[city].crossing_name.colorize(:blue)}" + "  Updated #{country[city].pass_standard_update_time}".colorize(:green)
    puts "  port status:".colorize(:light_blue) + " #{country[city].port_status}"
    puts "  hours:".colorize(:light_blue) + " #{country[city].hours}"
    puts "  PASSENGER LANES"
    puts "  standard lanes open:".colorize(:light_blue) + " #{country[city].pass_standard_lanes_open}" + "    delay:".colorize(:light_blue) + " #{country[city].pass_standard_delay_minutes} min"
    puts "  ready lanes open:".colorize(:light_blue) + " #{country[city].pass_ready_lanes_open}" + "       delay:".colorize(:light_blue) + " #{country[city].pass_ready_delay_minutes} min"
    puts "  sentri lanes open:".colorize(:light_blue) + " #{country[city].pass_sentri_lanes_open}" + "      delay:".colorize(:light_blue) + " #{country[city].pass_sentri_delay_minutes} min"
    puts "  PEDESTRIAN LANES"
    puts "  standard lanes open:".colorize(:light_blue) + " #{country[city].ped_standard_lanes_open}" + "    delay:".colorize(:light_blue) + " #{country[city].ped_standard_delay_minutes} min"
    puts "  ready lanes open:".colorize(:light_blue) + " #{country[city].ped_ready_lanes_open}" + "        delay:".colorize(:light_blue) + " #{country[city].ped_ready_delay_minutes} min"
    puts "  COMMERCIAL LANES"
    puts "  standard lanes open:".colorize(:light_blue) + " #{country[city].comm_standard_lanes_open}" + "    delay:".colorize(:light_blue) + " #{country[city].comm_standard_delay_minutes} min"
    puts "  FAST lanes open:".colorize(:light_blue) + " #{country[city].comm_fast_lanes_open}" + "        delay:".colorize(:light_blue) + " #{country[city].comm_fast_delay_minutes} min"
  end
  
  def display_all_ports
    Ports.all.each do |port|
      puts "#{port.port_name.upcase.colorize(:blue)}" + " |  #{port.crossing_name.colorize(:blue)}" + "  Updated #{port.pass_standard_update_time}".colorize(:green)
      puts "  port status:".colorize(:light_blue) + " #{port.port_status}"
      puts "  hours:".colorize(:light_blue) + " #{port.hours}"
      puts "  PASSENGER LANES"
      puts "  standard lanes open:".colorize(:light_blue) + " #{port.pass_standard_lanes_open}" + "    delay:".colorize(:light_blue) + " #{port.pass_standard_delay_minutes} min"
      puts "  ready lanes open:".colorize(:light_blue) + " #{port.pass_ready_lanes_open}" + "       delay:".colorize(:light_blue) + " #{port.pass_ready_delay_minutes} min"
      puts "  sentri lanes open:".colorize(:light_blue) + " #{port.pass_sentri_lanes_open}" + "      delay:".colorize(:light_blue) + " #{port.pass_sentri_delay_minutes} min"
      puts "  PEDESTRIAN LANES"
      puts "  standard lanes open:".colorize(:light_blue) + " #{port.ped_standard_lanes_open}" + "    delay:".colorize(:light_blue) + " #{port.ped_standard_delay_minutes} min"
      puts "  ready lanes open:".colorize(:light_blue) + " #{port.ped_ready_lanes_open}" + "        delay:".colorize(:light_blue) + " #{port.ped_ready_delay_minutes} min"
      puts "  COMMERCIAL LANES"
      puts "  standard lanes open:".colorize(:light_blue) + " #{port.comm_standard_lanes_open}" + "    delay:".colorize(:light_blue) + " #{port.comm_standard_delay_minutes} min"
      puts "  FAST lanes open:".colorize(:light_blue) + " #{port.comm_fast_lanes_open}" + "        delay:".colorize(:light_blue) + " #{port.comm_fast_delay_minutes} min"
      puts "----------------------".colorize(:green)
    end
  end
  
  def goodbye
    puts ""
    puts "Thank you for using Border Wait"
    puts "Safe Travels!"
    puts ""
  end

end
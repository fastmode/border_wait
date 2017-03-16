require_relative "../lib/scraper.rb"
require_relative "../lib/ports.rb"
require 'nokogiri'
require 'colorize'
require 'pry'

class CommandLineInteface
  SITE = "https://apps.cbp.gov/bwt/bwt.xml"
  
  def run
    make_ports
    welcome_display
    display_country_ports
  end
  
  def make_ports
    ports_array = Scraper.scrape_port_wait_times(SITE)
    Ports.create_from_collection(ports_array)
  end
  
  def welcome_display
    puts "Welcome to Border Wait"
    puts "Please select an option from below:"
    puts "1. Canadian Border Ports"
    puts "2. Mexico Border Ports"
    puts "3. List all ports"
  end
  
  
  def display_country_ports
    country = nil
    country = gets.strip
    if country == "1"
      puts "Canada Border".colorize(:blue)
      canada = Ports.all.select { |i| i.border == "Canadian Border"}
      canada.each.with_index(1) do |port, i|
        puts "#{i}. #{port.port_name}  #{port.crossing_name}"
      end
    elsif country == "2"
      puts "Mexico Border".colorize(:blue)
      mexico = Ports.all.select { |i| i.border == "Mexican Border"} 
      mexico.each.with_index(1) do |port, i|
        puts "#{i}. #{port.port_name}  #{port.crossing_name}"
      end
      puts "Please select a port of entry:"
      city = gets.strip.to_i-1
      puts mexico[city].port_name.upcase.colorize(:blue)
      puts "  crossing name:".colorize(:light_blue) + " #{mexico[city].crossing_name}"
      puts "  port status:".colorize(:light_blue) + " #{mexico[city].port_status}"
      puts "  border:".colorize(:light_blue) + " #{mexico[city].border}"
      puts "  PASSENGER LANES"
      puts "  standard lanes open :".colorize(:light_blue) + " #{mexico[city].pass_standard_lanes_open}"
      puts "  standard lane delay:".colorize(:light_blue) + " #{mexico[city].pass_standard_delay_minutes}"
      puts "  ready lanes open:".colorize(:light_blue) + " #{mexico[city].pass_ready_lanes_open}"
      puts "  ready lanes delay:".colorize(:light_blue) + " #{mexico[city].pass_ready_delay_minutes}"
      puts "  sentri lanes open:".colorize(:light_blue) + " #{mexico[city].pass_sentri_lanes_open}"
      puts "  sentri lanes delay:".colorize(:light_blue) + " #{mexico[city].pass_sentri_delay_minutes}"
      puts "----------------------".colorize(:green)
    elsif country == "3"
      display_all_ports
    else
      puts "Please enter a correct option."
      display_country_ports
    end
  end
  
  def display_all_ports
    Ports.all.each do |port|
      puts "#{port.port_name.upcase}".colorize(:blue)
      puts "  crossing name:".colorize(:light_blue) + " #{port.crossing_name}"
      puts "  port status:".colorize(:light_blue) + " #{port.port_status}"
      puts "  border:".colorize(:light_blue) + " #{port.border}"
      puts "  PASSENGER LANES"
      puts "  standard lanes open :".colorize(:light_blue) + " #{port.pass_standard_lanes_open}"
      puts "  standard lane delay:".colorize(:light_blue) + " #{port.pass_standard_delay_minutes}"
      puts "  ready lanes open:".colorize(:light_blue) + " #{port.pass_ready_lanes_open}"
      puts "  ready lanes delay:".colorize(:light_blue) + " #{port.pass_ready_delay_minutes}"
      puts "  sentri lanes open:".colorize(:light_blue) + " #{port.pass_sentri_lanes_open}"
      puts "  sentri lanes delay:".colorize(:light_blue) + " #{port.pass_sentri_delay_minutes}"
      puts "----------------------".colorize(:green)
    end
  end
    
end
class Ports

  attr_accessor :port_number, :border, :port_name, :crossing_name, :hours, :date, :port_status, :comm_max_lanes, :comm_standard_update_time,
                :comm_standard_operational_status, :comm_standard_delay_minutes, :comm_standard_lanes_open, :comm_fast_operational_status,
                :comm_fast_update_time, :comm_fast_delay_minutes, :comm_fast_lanes_open, :pass_max_lanes, :pass_standard_update_time,
                :pass_standard_operational_status, :pass_standard_delay_minutes, :pass_standard_lanes_open, :pass_sentri_update_time, 
                :pass_sentri_operational_status, :pass_sentri_delay_minutes, :pass_sentri_lanes_open, :pass_ready_update_time,
                :pass_ready_operational_status, :pass_ready_delay_minutes, :pass_ready_lanes_open, :ped_max_lanes, :ped_standard_update_time,
                :ped_standard_operational_status, :ped_standard_delay_minutes, :ped_standard_lanes_open, :ped_ready_update_time, 
                :ped_ready_operational_status, :ped_ready_delay_minutes, :ped_ready_lanes_open
  
  @@all = []
  
  def initialize(port_hash)
    port_hash.each do |k, v|
      self.send(("#{k}="), v)
    end
    @@all << self
  end
  
  def self.create_from_collection(ports_array)
    ports_array.each do |port|
      Ports.new(port)
    end
  end
  
  def self.all
    @@all
  end

end
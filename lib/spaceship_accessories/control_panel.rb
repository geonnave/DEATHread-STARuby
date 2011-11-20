require 'spaceship_accessories/spaceship_sensors'

class ControlPanel
  attr_accessor :sensors
  attr_accessor :panels
  
  def initialize
    @panels = Array.new
		@sensors = SpaceshipSensors.new
    @semaphore = Mutex.new
    @threads = Array.new
  end
  
=begin
Add a panel item. Panel item represents a Spaceship module.
=end
  def add_panel panel_item
    panel_item.sensors = @sensors
    @panels << panel_item
    create_panel_thread(panel_item)
  end

  def turn_on
    @panels.each{|panel_item| panel_item.activate}    
  end
  
  def resource_monitor
    while true
      puts @sensors
      puts @panels[0].alert_message
      sleep(1) #update monitor every 1 second
    end
  end
  
  
=begin
Create a Thread. 
Each thread represents a panel item.
Into Thread, panel item notify to sensors your spent.
The access of sensors are synchronized, beacuse sensors is one for all threads.
The amount_of_spending default is 1 (chance monitor values every 1 second).
if amount of spending is smaller(ex: 0.1) sensor values ​​will change more rapidly
=end
  def create_panel_thread panel_item, amount_of_spending=1
    Thread.new{Thread.current.join(0)
      while true
        @semaphore.synchronize {@sensors
          panel_item.notify_sensors}
        sleep(amount_of_spending)
      end
    }
  end
  
end

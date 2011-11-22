require './spaceship_accessories/spaceship_sensors'

class ControlPanel
  attr_accessor :sensors
  attr_accessor :panels
  $UPDATE_TIME = 0.5	#time, in seconds, to update the monitor

  def initialize sensors
    @panels = Array.new
		@sensors = sensors
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

  def turn_off
    @panels.each{|panel_item| panel_item.desactivate}
  end
  
	private
=begin
Create a Thread. 
Each thread represents a panel item.
Into Thread, panel item notify to sensors your spent.
The access of sensors are synchronized, beacuse sensors is one for all threads.
The amount_of_spending default is 1 (chance monitor values every 1 second).
if amount of spending is smaller(ex: 0.1) sensor values ​​will change more rapidly
=end
  def create_panel_thread panel_item
    Thread.new{Thread.current.join(1) #join: share the cpu time. 1 is the priority(can be changed, if nescessary)
      while true
        @semaphore.synchronize {@sensors
          panel_item.notify_sensors}
        sleep($UPDATE_TIME)
      end
    }
  end
  
end

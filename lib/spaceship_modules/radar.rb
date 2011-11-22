require './spaceship_modules/spaceship_module'
require './others/event_generator'

class Radar < SpaceshipModule 
  def initialize event_generator, energy_spent=-5, fuel_spent=-5, damages_spent=0
    @event_generator = event_generator
		super(energy_spent,fuel_spent,damages_spent)
  end

  def monitor
    if Random.rand(20) == 1
      @event_generator.generate_disaster
    elsif Random.rand(20) == 2
      @event_generator.generate_event
    end
    notifications if module_is_active?
  end
  
  def notify_sensors
    Thread.current.join(0) #this Thread need more CPU time, because your Method is more complex. (have a loop for calculate disasters damage)
    @event_generator.disasters.each{|disaster|
      @sensors.damages += disaster.damage
    }
    super
  end
  
	def notifications
    events_notifications + disasters_notifications
	end
  
  def disasters_notifications
    i=0
    notifications= "\nDisasters :\n"
		@event_generator.disasters.each{|disaster|
      notifications+= "index: #{i} --"  + disaster.to_s
      i+=1
    }
    return notifications
	end
  
  def events_notifications
    i=0
    notifications= "\nEvents :\n"
		@event_generator.events.each{|event|
      notifications+= "index: #{i} --" + event.to_s
      i+=1
    }
    return notifications
	end
end

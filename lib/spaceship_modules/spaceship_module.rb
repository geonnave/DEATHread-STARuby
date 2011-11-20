require 'spaceship_accessories/spaceship_sensors'

class SpaceShipModule < Thread
	
  def initialize(sensors, energy_spent=0, fuel_spent=0, damages_spent=0,&block)
    super
		@spaceship_sensors = sensors
		set_spent_or_recovery_values(energy_spent, fuel_spent, damages_spent)
		desactivate
  end

	def set_spent_or_recovery_values energy_spent=0, fuel_spent=0, damage_spent=0
		@energy_spent = energy_spent
		@fuel_spent = fuel_spent
		@damage_spent = damage_spent
	end
  
  def run
    while true
      notify_sensors if module_is_active?
      sleep(1)
    end
  end

	def activate
    @active = true
	end

	def module_is_active?
		@active
	end
	
	def desactivate
		@active = false
	end

	def notify_sensors
		@spaceship_sensors.notify(@energy_spent,@fuel_spent,@damage_spent)
	end

end

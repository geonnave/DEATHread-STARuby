require 'spaceship_modules/spaceship_module'

class OnBoardComputer < SpaceShipModule 


  def initialize sensors, energy_spent=-900, fuel_spent=0, damages_spent=0
		super(sensors,energy_spent,fuel_spent,damages_spent)
  end

	def alert_messsage
		buffer_message = String.new
		buffer_message+= "critical energy\n" if @spaceship_sensors.critical_energy?
		buffer_message+=  "critical fuel\n" if @spaceship_sensors.critical_fuel?
		buffer_message+=  "critical gamage\n" if @spaceship_sensors.critical_damage?
		buffer_message
	end
end

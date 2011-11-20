require 'spaceship_modules/spaceship_module'

class OnBoardComputer < SpaceShipModule 
  def initialize  energy_spent=-10, fuel_spent=0, damages_spent=0
		super(energy_spent,fuel_spent,damages_spent)
  end

	def alert_message
		buffer_message = String.new
		buffer_message+= "critical energy\n" if @sensors.critical_energy?
		buffer_message+=  "critical fuel\n" if @sensors.critical_fuel?
		buffer_message+=  "critical gamage\n" if @sensors.critical_damage?
    return buffer_message
	end
end

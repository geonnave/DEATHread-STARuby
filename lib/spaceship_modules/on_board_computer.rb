require './spaceship_modules/spaceship_module'

class OnBoardComputer < SpaceshipModule 
  def initialize  energy_spent=-5, fuel_spent=0, damages_spent=0
		super(energy_spent,fuel_spent,damages_spent)
  end

	def alert_message
		buffer_message = String.new
		buffer_message+= "critical energy\n" if @sensors.semi_critical_energy?
		buffer_message+=  "critical fuel\n" if @sensors.semi_critical_fuel?
		buffer_message+=  "critical damage\n" if @sensors.critical_damage?
		puts buffer_message 
    buffer_message == "" ? buffer_message : nil
	end
end

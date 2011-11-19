require 'main_controller'

class Spaceship
	
  def initialize
    @energy = 100
		@damage = 0
		@running = false
		@ctrl_panel = MainController.new
  end



	def turn_on
		@running = true if @damage <= 99 && @energy >= 1 && !running?
	end

	def turn_off
		@running = false
	end

	def running?
		@running
	end

	def to_s
		"Funcionando: #{@running}\n"+
		"Energia:     #{@energy}\n"+
		"Dano:        #{@damage}"
	end
end

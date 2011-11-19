require 'fuel'
require 'thrusters'
require 'danger_sensor'
require 'force_field'
require 'defense_weapons'
require 'route'

class MainController
	@@date = 101010
  def initialize
		fuel = Fuel.new
		danger_sensor = DangerSensor.new
  end
end

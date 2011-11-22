require './others/event_generator'
require './spaceship_accessories/spaceship_sensors'
require './spaceship_accessories/control_panel'
require './spaceship_modules/atack_module'
require './spaceship_modules/defense_module'
require './spaceship_modules/on_board_computer'
require './spaceship_modules/radar'
require './spaceship_accessories/control_panel'

class Spaceship
  attr_accessor :sensors, :control_panel, :event_generator, :captain

  def initialize captain="Darth Vader",energy=10000,fuel=10000,atack=1,defense=2
    @ENERGY =energy
    @FUEL = fuel
    @ATACK = atack
    @DEFENSE = defense
  
    @captain = captain
    @sensors = SpaceshipSensors.new(@ENERGY,@FUEL)
    @control_panel = ControlPanel.new(@sensors)
    @event_generator = EventGenerator.new

		@active = false
		
    construct_module(OnBoardComputer.new)
    construct_module(Radar.new(@event_generator))
    construct_module(AtackModule.new)
    construct_module(DefenseModule.new)
  end

  def resource_monitor computer_index=0,radar_index=1
    while active?
      puts modules_in_spaceship
      puts @sensors
      puts @control_panel.panels[computer_index].alert_message
      puts @control_panel.panels[radar_index].monitor
			turn_off if @sensors.critical_status?
      sleep($UPDATE_TIME) 
    end
  end

	def run
		turn_on
		if active?
			log = []
			
		end
		log
	end
  
  def desactive_module index
    @control_panel[index].desactivate
  end
  
  def active_module index
    @control_panel[index].activate
  end
  
  def turn_on
		if !@sensors.critical_status? || !active?
			@control_panel.turn_on
			@active = true
		else
			false
		end
  end

	def turn_off
    @control_panel.turn_off
		@active = false
	end
  
  def modules_in_spaceship
    modules_monitor = "#{self.class} modules:\n"
    i=0
    @control_panel.panels.each{|panel_item|
      modules_monitor+= "index: #{i} #{panel_item.class} active :#{panel_item.module_is_active?}\n"
      i+=1
    }
    return modules_monitor
  end
  
  def combat disaster_index=0,defense_module_index=3, atack_module_index=2
    @event_generator.combat(disaster_index, defense?[defense_module_index], atack?[atack_module_index])
  end
  
  def set_energy_bonus event_index=0
    @sensors.energy+= @event_generator.events[event_index].bonus
    @event_generator.delete_event(event_index)
  end
  
  def set_fuel_bonus event_index=0
    @sensors.fuel+= @event_generator.events[event_index].bonus
    @event_generator.delete_event(event_index)
  end
  
  def set_damage_bonus event_index=0
    @sensors.damage-= @event_generator.events[event_index].bonus
    @event_generator.delete_event(event_index)
  end
  
  def defense? defense_module_index=3
    return @DEFENSE if @control_panel.panels[defense_module_index].module_is_active?
    return 0
  end
  def atack? atack_module_index=2
    return @ATACK if @control_panel.panels[atack_module_index].module_is_active?
    return 0
  end
	def active?
		@active
	end

	def to_s
		"Spaceship captain: #{@captain}"
	end
  
  private
  def construct_module spaceship_module
    @control_panel.add_panel(spaceship_module)
  end
end

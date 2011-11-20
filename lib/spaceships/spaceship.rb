# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'others/event_generator'
require 'spaceship_accessories/spaceship_sensors'
require 'spaceship_accessories/control_panel'
require 'spaceship_modules/atack_module'
require 'spaceship_modules/defense_module'
require 'spaceship_modules/on_board_computer'
require 'spaceship_modules/radar'

class Spaceship
  attr_accessor :sensors, :control_panel, :event_generator
  
  def initialize captain="Darth Vader",energy=10000,fuel=10000,damage=90000,atack=1,defense=2
      
    @ENERGY =energy
    @FUEL = fuel
    @ATACK = atack
    @DEFENSE = defense
  
    @captain = captain
    @sensors = SpaceshipSensors.new(@ENERGY,@FUEL)
    @control_panel = ControlPanel.new(@sensors)
    @event_generator = EventGenerator.new
    construct_spaceship
  end
  
  def construct_spaceship
    @control_panel.add_panel(OnBoardComputer.new)
    @control_panel.add_panel(Radar.new(@event_generator))
    @control_panel.add_panel(AtackModule.new)
    @control_panel.add_panel(DefenseModule.new)
  end
  
  def desactive_module index
    @control_panel[index].desactivate
  end
  
  def active_module index
    @control_panel[index].activate
  end
  
  def turn_on
    @control_panel.turn_on
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
  
  def resource_monitor computer_index=0,radar_index=1
    while true
      puts modules_in_spaceship
      puts @sensors
      puts @control_panel.panels[computer_index].alert_message
      puts @control_panel.panels[radar_index].monitor
      sleep(1) #update monitor every 1 second
    end
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
end

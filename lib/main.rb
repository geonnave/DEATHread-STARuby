
require 'spaceship_modules/on_board_computer'
require 'spaceship_accessories/spaceship_sensors'
require 'spaceship_accessories/control_panel'
class Main


  mc = ControlPanel.new
  mc.add_panel(OnBoardComputer.new)
  mc.turn_on
 

  mc.resource_monitor



end
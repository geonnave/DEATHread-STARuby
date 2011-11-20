require 'spaceship'
require 'spaceship_modules/on_board_computer'
require 'spaceship_accessories/spaceship_sensors'
class Main

 
  #pc.notify_sensors

  i=0
  while true
    sensors = SpaceshipSensors.new()
    pc = OnBoardComputer.new(sensors){}
    pc.run
  
    puts pc.alert_message

  end
end
require 'spaceship'
require 'spaceship_modules/on_board_computer'
require 'spaceship_accessories/spaceship_sensors'

sensors = SpaceshipSensors.new
pc = OnBoardComputer.new(sensors)
pc.activate
 time = Time.now
puts time.to_f
#pc.notify_sensors


puts pc.alert_messsage

death_star = Spaceship.new

puts death_star

death_star.turn_on

puts death_star

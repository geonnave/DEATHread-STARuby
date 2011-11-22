require './spaceships/spaceship'
class DeathStar < Spaceship
  def initialize
    super("Darth Vader",20000,20000,0.5,2)
  end
end

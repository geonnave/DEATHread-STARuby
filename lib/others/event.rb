
class Event
  attr_reader :EVENTS_NAMES
  $EVENTS_NAMES=["FRIENDLY NATION", "HABITABLE PLANET FOUND", "SPACESHIP LOST FOUND"]
  def initialize name, bonus
    @name = name
    @bonus = bonus
  end

  
  def to_s
    "#{@name} Bonus: #{@bonus}\n"
  end
end

